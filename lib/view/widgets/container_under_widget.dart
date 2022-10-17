import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

class ContainerUnderWidget extends StatelessWidget {
  const ContainerUnderWidget({Key? key, required this.text, required this.textButton, required this.onPressed}) : super(key: key);
 final String text;
 final String textButton;
 final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:   BoxDecoration(
        color:Get.isDarkMode?pinkClr: mainColor,
        borderRadius: const BorderRadius.only(topRight:  Radius.circular(20),topLeft: Radius.circular(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(fontWeight: FontWeight.w500, text: text, fontSize: 20, color: Colors.white),
          TextButton(onPressed: onPressed, child: CustomText(fontWeight: FontWeight.w500, text: textButton, fontSize: 20, color: Colors.white,textDecoration: TextDecoration.underline,))
        ],
      ),
    );
  }
}
