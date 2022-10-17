import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/view/widgets/custom_text.dart';
import 'package:online_shop/view/widgets/setting/profile_widget.dart';
import '../widgets/setting/dark_mode_widget.dart';
import '../widgets/setting/language_widget.dart';
import '../widgets/setting/log_out_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          children: [
              ProfileWidget(),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomText(
              fontWeight: FontWeight.bold,
              text: 'GENERAL'.tr,
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            DarkModeWidget(),
            const SizedBox(
              height: 20,
            ),
              LanguageWidget(),
            const SizedBox(
              height: 20,
            ),
              LogOutWidget(),
          ],
        ));

  }
}
