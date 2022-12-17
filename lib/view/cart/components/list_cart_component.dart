import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../component/custom_text.dart';
import '../../../controller/controllers.dart';
import '../../../model/cart.dart';

class ListCartComponent extends StatelessWidget {
  final CartModel cartList;
  final int index;
  const ListCartComponent({
    Key? key,
    required this.cartList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CachedNetworkImage(
          width: 50,
          imageUrl: cartList.imageUrl!,
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
                onPressed: () {
                  cartController.removeItem(index);
                }),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomText(
                text: cartList.quantity.toString(),
              ),
            ),
            IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  cartController.addItem(index);
                }),
          ],
        ),
        Text(cartList.prixTotal.toString()),
      ],
    );
  }
}
