import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/auth_controller.dart';

import '../../../utils/themes.dart';
import 'dark_mode_widget.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_)=> InkWell(
      splashColor:Get.isDarkMode?pinkClr.withOpacity(0.7): mainColor.withOpacity(0.4),
      borderRadius: BorderRadius.circular(15),
      customBorder:const StadiumBorder(),
      onTap: () {
        Get.defaultDialog(
          buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          textCancel: 'No',
          radius: 10,
          cancelTextColor: Colors.black,
          textConfirm: 'Yes',
          confirmTextColor: Colors.white,
          onCancel: () {
            Get.back();
          },
          onConfirm: () {
            controller.signOut();
          },
          middleText: 'Are you sure you need logout ',
          middleTextStyle: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
          title: 'Log Out ',
          titleStyle: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        );

      },
      child: buildIconWidget(
        title: 'Logout'.tr,
        color: logOutSettings,
        icon: Icons.logout,
      ),
    ));
  }
}
