import 'package:flutter/material.dart';

import '../../../component/widget_body.dart';
import '../../../component/widget_titre.dart';
import '../../../model/adresse.dart';

class AdresseComonent extends StatelessWidget {
  final AdresseModel adresseSave;
  const AdresseComonent({
    Key? key,
    required this.adresseSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const WidgetTitre(
          titre: 'Adresse',
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 15.0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.13,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  WidgetBody(
                    adresseSave: adresseSave.fullName!,
                    adressTitre: 'Nom',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetBody(
                    adresseSave: adresseSave.adresse!,
                    adressTitre: 'Adresse',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetBody(
                    adresseSave: adresseSave.city!,
                    adressTitre: 'Ville',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetBody(
                    adresseSave: adresseSave.state!,
                    adressTitre: 'Pays',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetBody(
                    adresseSave: adresseSave.zipCode.toString(),
                    adressTitre: 'Code Postal',
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
