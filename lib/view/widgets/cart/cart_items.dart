import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/cart_controller.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

class CartItems extends StatelessWidget {
    CartItems({Key? key, required this.productModel, required this.index, required this.quantity}) : super(key: key);
  final ProductModel productModel;
 final controller =Get.find<CartController>();
 final int index;
 final int quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? pinkClr.withOpacity(0.6)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  productModel.image,
                   height: 150,
                  width: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.normal,
                      text: productModel.title,
                      fontSize: 18,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      fontWeight: FontWeight.normal,
                      text: '\$ ${controller.productSupTotal[index].toStringAsFixed(2)} ',
                      fontSize: 18,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.removeProductsFromCart(productModel);
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          )),
                      CustomText(
                        fontWeight: FontWeight.normal,
                        text: '$quantity',
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      IconButton(
                          onPressed: () {
                            controller.addProductToCart(productModel);
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          )),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        controller.removeOneProduct(productModel);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Get.isDarkMode ? Colors.black: Colors.red,
                        size: 30,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
