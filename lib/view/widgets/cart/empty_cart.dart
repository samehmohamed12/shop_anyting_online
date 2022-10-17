import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/routes/routes.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Your cart is ',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Empty',
                style: TextStyle(
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ])),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            fontWeight: FontWeight.bold,
            text: 'Add items to get started',
            fontSize: 15,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                  elevation: 0),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: const CustomText(
                  fontWeight: FontWeight.normal,
                  text: 'Go to Home',
                  fontSize: 20,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
