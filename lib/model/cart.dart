import 'dart:convert';

import 'product.dart';

List<CartModel> cartListFromJson(String val) => List<CartModel>.from(
    json.decode(val).map((val) => CartModel.fromJson(val)));

class CartModel extends ProductModel {
  int quantity = 0;
  double? prixTotal;

  CartModel(
      {id,
      this.prixTotal,
      description,
      name,
      category,
      imageUrl,
      oldPrice,
      price,
      required this.quantity})
      : super(
          description: description,
          id: id,
          name: name,
          category: category,
          imageUrl: imageUrl,
          oldPrice: oldPrice,
          price: price,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final product = ProductModel.fromJson(json);
    final quantity = json['quantity'];
    final prixTotal = json['prixTotal'];
    return CartModel(
        id: product.id,
        name: product.name,
        category: product.category,
        imageUrl: product.imageUrl,
        oldPrice: product.oldPrice,
        price: product.price,
        description: product.description,
        quantity: quantity,
        prixTotal: prixTotal);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['imageUrl'] = this.imageUrl;
    data['oldPrice'] = this.oldPrice;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    data['prixTotal'] = this.prixTotal;
    return data;
  }
}
