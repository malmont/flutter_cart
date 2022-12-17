import 'package:flutter/material.dart';
import 'package:flutter_cart/component/custom_btn.dart';
import 'package:get/get.dart';

class boutonAchatComponent extends StatelessWidget {
  final double sumCart;
  final String route;
  const boutonAchatComponent({
    Key? key,
    required this.sumCart,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8),
        child: CustomButton(
            text: "Valider (\$${sumCart})",
            onTap: () {
              Get.toNamed(route);
            }));
  }
}
