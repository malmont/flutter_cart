import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/custom_btn.dart';
import '../../model/adresse.dart';
import 'validation_commande.dart';

class AdresseCommande extends StatefulWidget {
  const AdresseCommande({Key? key}) : super(key: key);

  @override
  State<AdresseCommande> createState() => _AdresseCommandeState();
}

class _AdresseCommandeState extends State<AdresseCommande> {
  @override
  Widget build(BuildContext context) {
    late String adresse;
    late String fullname;
    late String ville;
    late String pays;
    late String zipCode;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: SafeArea(
              child: AppBar(
            toolbarHeight: 100,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Adresse"),
              ],
            ),
          ))),
      body: Container(
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    onSaved: (value) {
                      fullname = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Merci d'entrer votre nom et prénom";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        helperText: "Exemple : 'danielle test '",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        labelText: "FullName",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    onSaved: (value) {
                      adresse = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Merci d'entrer une adresse";
                      } else if (value.length > 35) {
                        return "Pas plus de 50 caractères";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        helperText: "Exemple : ' Impasse de la sablière'",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        labelText: "Adresse",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    onSaved: (value) {
                      ville = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Merci d'entrer une ville";
                      } else if (value.length > 35) {
                        return "Pas plus de 50 caractères";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        helperText: "Exemple : 'Ducos'",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        labelText: "Ville",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    onSaved: (value) {
                      pays = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Merci d'entrer un Pays";
                      } else if (value.length > 35) {
                        return "Pas plus de 50 caractères";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        helperText: "Exemple : 'France'",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        labelText: "pays",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    onSaved: (value) {
                      zipCode = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Code postal";
                      } else if (value.length > 35) {
                        return "Pas plus de 50 caractères";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        helperText: "Exemple : '97224'",
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(15.0)),
                        labelText: "Code Postal",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8),
                      child: CustomButton(
                          text: "Continuer",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              {
                                setState(() {
                                  AdresseModel adresseSave = AdresseModel(
                                    adresse: adresse,
                                    id: 1,
                                    fullName: fullname,
                                    state: ville,
                                    zipCode: int.parse(zipCode),
                                    city: pays,
                                  );
                                  Get.to(() => ValidationCommande(
                                        adresseSave: adresseSave,
                                      ));
                                });
                              }
                            }
                          }))
                ],
              ),
            ),
          )),
    );
  }
}
