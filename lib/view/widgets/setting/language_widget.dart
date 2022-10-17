import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/setting_controller.dart';
import 'package:online_shop/utils/my_string.dart';
import 'package:online_shop/utils/themes.dart';
import 'dark_mode_widget.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIconWidget(
                  icon: Icons.language,
                  title: 'Language'.tr,
                  color: languageSettings,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        width: 2,
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (value) {
                       controller.changeLanguage(value!);
                       Get.updateLocale(Locale(value));
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 25,
                      items: [
                        DropdownMenuItem(
                          value: ene,
                          child: Text(
                            english,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                            value: ara,
                            child: Text(
                              arabic,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )),
                        DropdownMenuItem(
                            value: frf,
                            child: Text(
                              france,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )),
                      ],
                      value: controller.langLocal,
                    ),
                  ),
                )
              ],
            ));
  }
}
