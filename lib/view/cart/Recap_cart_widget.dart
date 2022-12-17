import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../component/bouton_acaht_component.dart';
import '../../component/custom_btn.dart';
import '../../component/custom_text.dart';
import '../../component/widget_body.dart';
import '../../component/widget_titre.dart';
import '../../controller/controllers.dart';
import '../../model/adresse.dart';
import '../../model/cart.dart';
import 'components/list_cart_component.dart';

class RecapCartWidgetWidget extends StatelessWidget {
  const RecapCartWidgetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ListView.builder(
            itemCount: cartController.cartList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
                child: Card(
                  child: ListTile(
                    onTap: () async {},
                    title: Container(
                      child: Row(
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
                    ),
                    subtitle: ListCartComponent(
                      cartList: cartController.cartList[index],
                      index: index,
                    ),
                    isThreeLine: true,
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
