import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/cart_controller.dart';
import '../../controller/controllers.dart';
import '../../model/cart.dart';
import '../../model/product.dart';
import '../cart/Shopping_cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // NumberFormat formatter = NumberFormat('00');
  int _qty = 1;
  int _tagIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("détails du produits")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                width: 200,
                imageUrl: widget.product.imageUrl!,
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
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.product.name!,
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '\$${widget.product.price}',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'About this product:',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.product.description!,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
          ),
          onPressed: () {
            var cartItem = CartModel(
              id: widget.product.id,
              category: widget.product.category,
              name: widget.product.name,
              oldPrice: widget.product.oldPrice,
              price: widget.product.price,
              imageUrl: widget.product.imageUrl,
              description: widget.product.description,
              prixTotal: widget.product.price,
              quantity: 1,
            );
            cartController.updateCartList(cartItem);
          },
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              'Add to Card',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(
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
              Get.off(() => const ShoppingCartScreen());
            },
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
