import 'dart:convert';

List<ProductModel> productListFromJson(String val) => List<ProductModel>.from(
    json.decode(val).map((val) => ProductModel.fromJson(val)));

class ProductModel {
  int? id;
  String? name;
  String? category;
  String? imageUrl;
  double? oldPrice;
  double? price;
  String? description;

  ProductModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.oldPrice,
      required this.price,
      required this.description});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageUrl = json['imageUrl'];
    oldPrice = json['oldPrice'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['imageUrl'] = this.imageUrl;
    data['oldPrice'] = this.oldPrice;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}
