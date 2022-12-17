import 'package:flutter_cart/model/cart.dart';
import 'package:flutter_cart/controller/cart_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final cartController = CartController();

  test('Somme total du panier', () {
    CartModel item1 = CartModel(
        quantity: 1,
        id: 0,
        oldPrice: 100.00,
        price: 200.00,
        prixTotal: 200.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    CartModel item2 = CartModel(
        quantity: 1,
        oldPrice: 100.00,
        id: 1,
        price: 400.00,
        prixTotal: 400.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    cartController.cartList.value = [];
    cartController.sumItem.value = 0;
    cartController.sumCart.value = 0;
    cartController.updateCartList(item1);
    expect(cartController.sumCart.value, 200.00);
    cartController.updateCartList(item1);
    expect(cartController.sumCart.value, 400.00);
    cartController.updateCartList(item2);
    expect(cartController.sumCart.value, 800.00);
  });

  test('Somme total des itmes', () {
    CartModel item1 = CartModel(
        quantity: 1,
        id: 0,
        oldPrice: 100.00,
        price: 200.00,
        prixTotal: 200.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    CartModel item2 = CartModel(
        quantity: 1,
        oldPrice: 100.00,
        id: 1,
        price: 400.00,
        prixTotal: 400.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    cartController.cartList.value = [];
    cartController.sumItem.value = 0;
    cartController.sumCart.value = 0;
    cartController.updateCartList(item1);
    expect(cartController.sumItem.value, 1);
    cartController.updateCartList(item1);
    expect(cartController.sumItem.value, 2);
    cartController.updateCartList(item2);
    expect(cartController.sumItem.value, 3);
  });

  test('Comportement  ajout items', () {
    CartModel item1 = CartModel(
        quantity: 1,
        id: 0,
        oldPrice: 100.00,
        price: 200.00,
        prixTotal: 200.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    CartModel item2 = CartModel(
        quantity: 1,
        oldPrice: 100.00,
        id: 1,
        price: 400.00,
        prixTotal: 400.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    cartController.cartList.value = [];
    cartController.updateCartList(item1);
    expect(cartController.cartList.length, 1);
    cartController.updateCartList(item1);
    expect(cartController.cartList.length, 1);
    cartController.updateCartList(item2);
    expect(cartController.cartList.length, 2);
    cartController.updateCartList(item2);
    expect(cartController.cartList.length, 2);
  });

  test(' ajout items', () {
    CartModel item1 = CartModel(
        quantity: 1,
        id: 0,
        oldPrice: 100.00,
        price: 200.00,
        prixTotal: 200.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    CartModel item2 = CartModel(
        quantity: 1,
        oldPrice: 100.00,
        id: 1,
        price: 400.00,
        prixTotal: 400.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    cartController.cartList.value = [];
    cartController.updateCartList(item1);
    expect(cartController.cartList[0].quantity, 1);
    cartController.addItem(0);
    expect(cartController.cartList[0].quantity, 2);
    cartController.addItem(0);
    expect(cartController.cartList[0].quantity, 3);
    cartController.addItem(0);
    expect(cartController.cartList[0].quantity, 4);
    cartController.updateCartList(item2);
    expect(cartController.cartList[1].quantity, 1);
    cartController.addItem(1);
    expect(cartController.cartList[1].quantity, 2);
    cartController.addItem(1);
    expect(cartController.cartList[1].quantity, 3);
    cartController.addItem(1);
    expect(cartController.cartList[1].quantity, 4);
  });

  test(' supprimer items', () {
    CartModel item1 = CartModel(
        quantity: 1,
        id: 0,
        oldPrice: 100.00,
        price: 200.00,
        prixTotal: 200.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    CartModel item2 = CartModel(
        quantity: 1,
        oldPrice: 100.00,
        id: 1,
        price: 400.00,
        prixTotal: 400.00,
        name: "article1",
        description: "superbe model",
        imageUrl: "");
    cartController.cartList.value = [];
    cartController.updateCartList(item1);
    expect(cartController.cartList[0].quantity, 1);
    cartController.addItem(0);
    expect(cartController.cartList[0].quantity, 2);
    cartController.removeItem(0);
    expect(cartController.cartList[0].quantity, 1);
    cartController.removeItem(0);
    expect(cartController.cartList[0].quantity, 1);

    cartController.updateCartList(item2);
    expect(cartController.cartList[1].quantity, 1);
    cartController.addItem(1);
    expect(cartController.cartList[1].quantity, 2);
    cartController.removeItem(1);
    expect(cartController.cartList[1].quantity, 1);
    cartController.removeItem(1);
    expect(cartController.cartList[1].quantity, 1);
  });
}
