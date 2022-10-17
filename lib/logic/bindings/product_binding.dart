import 'package:get/get.dart';
import 'package:online_shop/logic/controller/cart_controller.dart';
import 'package:online_shop/logic/controller/category_controller.dart';
import 'package:online_shop/logic/controller/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.lazyPut(() => CartController());
  }

}