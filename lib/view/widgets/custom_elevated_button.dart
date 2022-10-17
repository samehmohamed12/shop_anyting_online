import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

import '../../utils/themes.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
            maximumSize: const Size(360, 50)),
        onPressed: onPressed,
        child: CustomText(
          fontWeight: FontWeight.w500,
          text: text,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
