import 'package:get/get.dart';

import '../model/product.dart';
import '../service/remote_product.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  // RxString searchVal = ''.obs;
  RxList<ProductModel> productList =
      List<ProductModel>.empty(growable: true).obs;
  RxBool isProducLoading = false.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProducLoading(true);
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result));
      }
    } finally {
      isProducLoading(false);
      print(productList[0].name);
    }
  }
}
