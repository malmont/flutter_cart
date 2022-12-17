import 'package:flutter/material.dart';
import 'package:flutter_cart/model/commande.dart';

import '../../component/widget_titre.dart';

import 'components/adresse_component.dart';
import 'components/list_article_commande.dart';

class RecapCommande extends StatelessWidget {
  final CommandeModel commande;
  const RecapCommande({
    Key? key,
    required this.commande,
  }) : super(key: key);

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
                Text("Récapitulatif de votre commande"),
              ],
            ),
          ))),
      body: ListView(
        children: [
          SizedBox(
            height: 240,
            child: AdresseComonent(
              adresseSave: commande.adresse!,
            ),
          ),
          const WidgetTitre(
            titre: 'Récapitulatif de la commande',
          ),
          SizedBox(
            height: 390,
            child: RecapCommandeComponent(cartList: commande.listCart!),
          ),
        ],
      ),
    );
  }
}
