import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../component/custom_text.dart';

class RecapCommandeComponent extends StatelessWidget {
  final List<CartModel> cartList;
  const RecapCommandeComponent({
    Key? key,
    required this.cartList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
              child: Card(
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
                            Text(cartList[index].name!)
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
                        imageUrl: cartList[index].imageUrl!,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.grey.shade300,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Center(
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
                              onPressed: () {}),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CustomText(
                              text: cartList[index].quantity.toString(),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.chevron_right),
                              onPressed: () {}),
                        ],
                      ),
                      Text(cartList[index].prixTotal.toString()),
                    ],
                  ),
                  isThreeLine: true,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
