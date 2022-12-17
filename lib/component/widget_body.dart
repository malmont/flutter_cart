import 'package:flutter/material.dart';

class WidgetBody extends StatelessWidget {
  final String adresseSave;
  final String adressTitre;
  const WidgetBody({
    Key? key,
    required this.adresseSave,
    required this.adressTitre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            adressTitre,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(adresseSave)
        ],
      ),
    );
  }
}
