import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/header.dart';
import '../../controller/controllers.dart';
import 'components/product_grid.dart';
import 'components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(child: Obx(() {
            if (productController.isProducLoading.value) {
              return const ProductLoadingGrid();
            } else {
              if (productController.productList.isNotEmpty) {
                return ProductGrid(products: productController.productList);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/product_not_found.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text('Product not found'),
                    )
                  ],
                );
              }
            }
          }))
        ],
      ),
    );
  }
}
