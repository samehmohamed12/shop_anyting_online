import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

import '../widgets/home/card_items.dart';
import '../widgets/home/custom_search_form_filed.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                    CustomText(
                    fontWeight: FontWeight.w500,
                    text: 'Find Your'.tr,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                    CustomText(
                    fontWeight: FontWeight.w500,
                    text: 'Inspiration'.tr,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomSearchFormFiled()
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
                fontWeight: FontWeight.w500,
                text: 'Categories'.tr,
                fontSize: 20,
                color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
            CardItems(),

        ],
      ),
    ));
  }
}
