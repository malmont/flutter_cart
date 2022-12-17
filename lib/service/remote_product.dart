import 'package:flutter/services.dart';

class RemoteProductService {
  Future<dynamic> get() async {
    var response = await rootBundle.loadString("assets/my_product_json.json");
    return response;
  }
}
