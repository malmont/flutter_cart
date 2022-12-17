import 'package:get/get.dart';

import '../model/cart.dart';
import '../model/product.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();

  RxList<CartModel> cartList = List<CartModel>.empty(growable: true).obs;
  // RxBool isProducLoading = false.obs;
  RxDouble sumCart = 0.00.obs;
  RxInt sumItem = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  sumCartFunction() {
    return cartList
        .map((e) => e.prixTotal!)
        .reduce((previousValue, element) => previousValue + element);
  }

  sumItemFunction() {
    return cartList
        .map((e) => e.quantity)
        .reduce((previousValue, element) => previousValue + element);
  }

  addItem(int index) {
    cartList[index].quantity += 1;
    cartList[index].prixTotal =
        cartList[index].price! * cartList[index].quantity;
    sumCart.value = sumCartFunction();
    sumItem.value = sumItemFunction();
  }

  removeItem(int index) {
    if (cartList[index].quantity > 1) {
      cartList[index].quantity -= 1;
      cartList[index].prixTotal =
          cartList[index].price! * cartList[index].quantity;
      sumCart.value = sumCartFunction();
      sumItem.value = sumItemFunction();
    }
  }

  updateCartList(CartModel cartItem) {
    if (isExistsInCart(cartItem)) {
      for (var n = cartList.length - 1; n >= 0; n--) {
        if (cartList[n].id == cartItem.id) {
          cartList[n].quantity += 1;
          cartList[n].prixTotal = cartList[n].price! * cartList[n].quantity;
        }
      }
    } else {
      cartList.add(cartItem);
      // for (var n = cartList.length - 1; n >= 0; n--) {}
    }
    sumCart.value = sumCartFunction();
    sumItem.value = sumItemFunction();
    print(sumCart);
    print(sumItem);
  }

  deleteCart() {
    cartList.value = [];
    sumCart.value = 0;
    sumItem.value = 0;
  }

  bool isExistsInCart(CartModel cartItem) {
    if (cartList.map((item) => item.id).contains(cartItem.id)) {
      return true;
    }
    return false;
  }
}
