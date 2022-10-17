import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/auth_controller.dart';
import 'package:online_shop/logic/controller/setting_controller.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
 final authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration:   BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    authController.displayUserPhoto.value,
                   ))),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              fontWeight: FontWeight.w500,
              text: controller.capitalize(authController.displayUserName.value),
              fontSize: 22,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            CustomText(
              fontWeight: FontWeight.normal,
              text: authController.displayUserEmail.value,
              fontSize: 14,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        )
      ],
    ));
  }
}
