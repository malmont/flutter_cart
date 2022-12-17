import 'package:flutter/material.dart';

import 'components/list_total_commande.dart';

class TotalCommande extends StatefulWidget {
  const TotalCommande({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalCommande> createState() => _TotalCommandeState();
}

class _TotalCommandeState extends State<TotalCommande> {
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
                  Text("Liste de vos commandes"),
                ],
              ),
            ))),
        body: const ListTotalCommande(),
      ),
    );
  }
}
