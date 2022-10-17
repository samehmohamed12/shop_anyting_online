import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/cart_controller.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/view/widgets/custom_text.dart';
import '../../../utils/themes.dart';

class AddCart extends StatelessWidget {
    AddCart({Key? key, required this.product }) : super(key: key);
 final ProductModel product;
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                CustomText(
                fontWeight: FontWeight.bold,
                text: 'Price'.tr,
                fontSize: 18,
                color: Colors.grey,
              ),
              CustomText(
                fontWeight: FontWeight.bold,
                text: '\$ ${product.price}',
                fontSize: 24,
                color: Get.isDarkMode?Colors.white:Colors.black,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {
                    controller.addProductToCart(product);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                      CustomText(
                        fontWeight: FontWeight.bold,
                        text: 'Add to Cart  '.tr,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      const Icon(Icons.shopping_cart_outlined),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
