import 'dart:convert';

import 'adresse.dart';
import 'cart.dart';
import 'product.dart';

List<CommandeModel> commandListFromJson(String val) => List<CommandeModel>.from(
    json.decode(val).map((val) => CommandeModel.fromJson(val)));

class CommandeModel {
  AdresseModel? adresse;
  List<CartModel>? listCart;
  String? id;

  CommandeModel({
    required this.id,
    required this.listCart,
    required this.adresse,
  });

  factory CommandeModel.fromJson(Map<String, dynamic> json) {
    // final cart = CartModel.fromJson(json);
    // final adresse = AdresseModel.fromJson(json);
    return CommandeModel(
      adresse: AdresseModel.fromJson(json["adresse"]),
      id: null,
      listCart: List<CartModel>.from(
          json["listCart"].map((x) => CartModel.fromJson(x)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['adresse'] = this.adresse!.toJson();
    data['id'] = this.id;
    data['listCart'] = List<dynamic>.from(listCart!.map((x) => x.toJson()));
    return data;
  }
}
