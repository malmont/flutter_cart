import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../component/bouton_acaht_component.dart';
import '../../../component/custom_text.dart';
import '../../../controller/controllers.dart';

class ListCart extends StatefulWidget {
  const ListCart({
    Key? key,
  }) : super(key: key);

  @override
  State<ListCart> createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.cartList.isEmpty) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            "panier vide.",
            style: TextStyle(color: Colors.orange[600], fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        );
      }

      // List<ModelMission>? MissionListPerAccount;

      // MissionListPerAccount = missionsController.MissionList.where(
      //     (c) => c.emailUser.contains(accountToken)).toList();

      return Stack(
        children: [
          ListView.builder(
            itemCount: cartController.cartList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
                child: Dismissible(
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                          content: "le produit à bien été supprimées",
                          lotties: 'assets/trash.json'));
                    }

                    if (direction == DismissDirection.startToEnd) {
                      ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
                          content: "le produit à bien été supprimées",
                          lotties: 'assets/trash.json'));
                    }
                  },
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      final bool? resultat = await showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Confirmation",
                                style: TextStyle(color: Colors.blue),
                              ),
                              content: const Text(
                                  "Voulez vous supprimer ce produit"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text("Oui"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text("Non"),
                                )
                              ],
                            );
                          });
                      return resultat;
                    }
                    if (direction == DismissDirection.endToStart) {
                      final bool? resultat = await showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Confirmation",
                                style: TextStyle(color: Colors.blue),
                              ),
                              content: const Text(
                                  "Voulez vous supprimer ce produit"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text("Oui"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text("Non"),
                                )
                              ],
                            );
                          });
                      return resultat;
                    }
                    return true;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.only(right: 10.0),
                    alignment: Alignment.centerLeft,
                    child: const Icon(
                      Icons.delete,
                      size: 55.0,
                      color: Colors.white,
                    ),
                  ),
                  secondaryBackground: Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      size: 55.0,
                      color: Colors.white,
                    ),
                  ),
                  key: Key(UniqueKey().toString()),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 45.0, // soften the shadow
                          spreadRadius: 2.0, //extend the shadow
                          offset: Offset(
                            3.0, // Move to right 10  horizontally
                            3.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 20.0,
                      child: ListTile(
                        onTap: () async {},
                        title: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Nom ".toUpperCase(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(cartController.cartList[index].name!)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CachedNetworkImage(
                              width: 50,
                              imageUrl:
                                  cartController.cartList[index].imageUrl!,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.white,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Center(
                                      child: Icon(
                                Icons.error_outline,
                                color: Colors.grey,
                              )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.chevron_left),
                                    onPressed: () {
                                      cartController.removeItem(index);
                                    }),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CustomText(
                                    text: cartController
                                        .cartList[index].quantity
                                        .toString(),
                                  ),
                                ),
                                IconButton(
                                    icon: const Icon(Icons.chevron_right),
                                    onPressed: () {
                                      cartController.addItem(index);
                                    }),
                              ],
                            ),
                            Text(cartController.cartList[index].prixTotal
                                .toString()),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
              bottom: 30,
              child: boutonAchatComponent(
                sumCart: cartController.sumCart.value,
                route: "/adresseCommande",
              ))
        ],
      );
    });
  }

  SnackBar _buildSnackBar({@required String? content, String? lotties}) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 80,
        child: Row(
          children: [
            Lottie.asset(lotties!, width: 60),
            Text(
              content!,
              style: const TextStyle(color: Colors.purple),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
