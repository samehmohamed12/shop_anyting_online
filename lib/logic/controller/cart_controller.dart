import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/routes/routes.dart';

import '../../model/product_model.dart';
import '../../utils/themes.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += 1;

    } else {
      productsMap[productModel] = 1;
    }
  }

  void removeProductsFromCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel) &&
        productsMap[productModel] == 1) {
      productsMap.removeWhere((key, value) => key == productModel);
    } else {
      productsMap[productModel] -= 1;
    }

  }

  void removeOneProduct(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
      textCancel: 'No',
      radius: 10,
      cancelTextColor: Colors.black,
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      middleText: 'Are you sure you need clear products? ',
      middleTextStyle: TextStyle(
          fontSize: 18,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold),
      title: 'Clean Products',
      titleStyle: TextStyle(
          fontSize: 18,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold),
    );
  }

  int quantity() {
    if(productsMap.isEmpty){
      return 0;
    }else{
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }

  }

  get productSupTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
