import 'package:flutter/material.dart';

import 'components/list_cart.dart';


class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: SafeArea(
                child: AppBar(
              toolbarHeight: 100,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("panier en cours"),
                ],
              ),
            ))),
        body: const ListCart(),
      ),
    );
  }
}
