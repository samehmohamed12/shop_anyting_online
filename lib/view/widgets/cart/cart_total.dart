import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/cart_controller.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

import '../../../routes/routes.dart';

class CartTotal extends StatelessWidget {
    CartTotal({Key? key}) : super(key: key);
  final controller=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return  Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  fontWeight: FontWeight.normal,
                  text: 'Total',
                  fontSize: 15,
                  color: Colors.grey,
                ),
                CustomText(
                  fontWeight: FontWeight.normal,
                  text: '\$ ${controller.total}',
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                onPressed: () {
                  Get.toNamed(Routes.paymentScreen);
                },
                child: Row(
                  children: const [
                    CustomText(
                      fontWeight: FontWeight.bold,
                      text: 'Check Out',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    Icon(Icons.shopping_cart),
                  ],
                ))
          ],
        ),
      );
    });
  }
}
