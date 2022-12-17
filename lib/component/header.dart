import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllers.dart';
import '../view/cart/Shopping_cart_screen.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 10)
      ]),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(0, 0),
                      blurRadius: 8)
                ]),
            // child: Obx(
            //   () => TextField(
            //     autofocus: false,
            //     controller: productController.searchTextEditinController,
            //     onSubmitted: (val) {
            //       productController.getProductByName(keyword: val);
            //       dashboardController.updateIndex(1);
            //     },
            //     onChanged: (val) {
            //       productController.searchVal.value = val;
            //     },
            //     decoration: InputDecoration(
            //         suffixIcon: productController
            //                 .searchVal.value.isNotEmpty
            //             ? IconButton(
            //                 onPressed: () {
            //                   FocusScope.of(context)
            //                       .requestFocus(FocusNode());
            //                   productController.searchTextEditinController
            //                       .clear();
            //                   productController.searchVal.value = '';
            //                   productController.getProducts();
            //                 },
            //                 icon: const Icon(Icons.clear))
            //             : null,
            //         contentPadding: const EdgeInsets.symmetric(
            //             horizontal: 14, vertical: 16),
            //         fillColor: Colors.white,
            //         filled: true,
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(24),
            //             borderSide: BorderSide.none),
            //         hintText: "Search...",
            //         prefixIcon: const Icon(Icons.search)),
            //   ),
            // )
          )),
          const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 8)
                ]),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          Obx(
            () => Badge(
              position: const BadgePosition(top: 0, end: 1),
              animationDuration: const Duration(microseconds: 200),
              animationType: BadgeAnimationType.scale,
              showBadge: true,
              badgeColor: Colors.red,
              badgeContent: Text(
                cartController.cartList.length > 9
                    ? '9+'
                    : '${cartController.sumItem}',
                style: const TextStyle(color: Colors.white),
              ),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  Get.to(() =>  ShoppingCartScreen());
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
