import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../controller/commande_controller.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/product_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashoardController());
    Get.put(CartController());
    Get.put(ProductController());
    Get.put(CommandeController());
    // Get.put(AuthController());
  }
}
