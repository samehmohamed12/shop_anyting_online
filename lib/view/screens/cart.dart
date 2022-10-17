import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/cart_controller.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/cart/cart_items.dart';
import 'package:online_shop/view/widgets/cart/empty_cart.dart';

import '../widgets/cart/cart_total.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            title: const Text('Cart items'),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(onPressed: () {
                controller.clearAllProducts();
              }, icon: const Icon(Icons.backspace))
            ],
          ),
          body: Obx(() {
            if(controller.productsMap.isEmpty){
              return const EmptyCart();
            }else{
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => CartItems(
                          index: index,
                          productModel:
                          controller.productsMap.keys.toList()[index],
                          quantity:
                          controller.productsMap.values .toList()[index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                        itemCount: controller.productsMap.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CartTotal( ),
                  )
                ],
              );
            }

          })),
    );
  }
}
