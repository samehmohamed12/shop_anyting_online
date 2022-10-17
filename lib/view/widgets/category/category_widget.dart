import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/category_controller.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/category/category_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(
          color: Get.isDarkMode ? pinkClr : mainColor,
        ));
      } else {
        return Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      controller.getCategoryIndex(index);
                      Get.to(() => CategoryItems(nameCategory: controller.categoryNameList[index],));
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image:   DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                controller.imageCategory[index]
                               ))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            controller.categoryNameList[index],
                            style: const TextStyle(
                              backgroundColor: Colors.black26,
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
              itemCount: controller.categoryNameList.length),
        );
      }
    });
  }
}
