import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/auth_controller.dart';

import '../../utils/themes.dart';
import 'custom_text.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key, required this.text, required this.underlineText})
      : super(key: key);
  final controller = Get.find<AuthController>();
  final String text;
  final String underlineText;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? const Icon(
                          Icons.done,
                          size: 30,
                          color: pinkClr,
                        )
                      : Image.asset('assets/images/check.png')
                  : const SizedBox(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              CustomText(
                fontWeight: FontWeight.w500,
                text: text,
                fontSize: 15,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              CustomText(
                fontWeight: FontWeight.w500,
                text: underlineText,
                fontSize: 15,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                textDecoration: TextDecoration.underline,
              )
            ],
          )
        ],
      );
    });
  }
}
