import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/setting_controller.dart';
import 'package:online_shop/logic/controller/theme_controller.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(
              title: 'Dark Mode'.tr,
              icon: Icons.dark_mode,
              color: darkSettings,
            ),
            Switch(
              activeTrackColor: mainColor,
              activeColor: mainColor,
              value: controller.switchValue.value,
              onChanged: (value) {
                ThemeController().changesTheme();
                controller.switchValue.value = value;
              },
            )
          ],
        ));
  }


}
Widget buildIconWidget({
  required String title,
  required IconData icon,
  required Color color,
}) {
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        CustomText(
          fontWeight: FontWeight.bold,
          text: title,
          fontSize: 22,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    ),
  );
}
