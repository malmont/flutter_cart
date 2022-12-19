import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid/nanoid.dart';

import '../../component/bouton_acaht_component.dart';
import '../../component/custom_btn.dart';
import '../../component/widget_titre.dart';
import '../../controller/controllers.dart';
import '../../model/adresse.dart';
import '../../model/cart.dart';
import '../../model/commande.dart';
import '../cart/Recap_cart_widget.dart';
import 'components/adresse_component.dart';

class ValidationCommande extends StatelessWidget {
  final AdresseModel adresseSave;
  const ValidationCommande({Key? key, required this.adresseSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: SafeArea(
              child: AppBar(
            toolbarHeight: 100,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Validation commande"),
              ],
            ),
          ))),
      body: ListView(
        children: [
          SizedBox(
            height: 240,
            child: AdresseComonent(
              adresseSave: adresseSave,
            ),
          ),
          const WidgetTitre(
            titre: 'Récapitulatif de la commande',
          ),
          const SizedBox(
            height: 390,
            child: RecapCartWidgetWidget(),
          ),
          // boutonAchatComponent(
          //   sumCart: cartController.sumCart.value,
          //   route: '',
          // )
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () async {
                var commande = CommandeModel(
                  adresse: adresseSave,
                  id: nanoid(),
                  listCart: List.from(cartController.cartList),
                );
                commandeController.updateCommandeList(commande);
                await commandeController.save(remove: false);
                cartController.deleteCart();

                Get.offAllNamed("/");
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Valider (\$${cartController.sumCart.value})",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
