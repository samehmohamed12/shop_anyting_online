import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/product_controller.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

import '../../model/product_model.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/heart.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                    fontWeight: FontWeight.w400,
                    text: 'Please, Add your favorites products.',
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : Colors.black)
              ],
            ),
          );
        }else{
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildFavoriteItems(controller.favoriteList[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: controller.favoriteList.length),
          );
        }
      }),
    );
  }

  Widget buildFavoriteItems(ProductModel product) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            product.image,
             height: 93.5,
            width: 89,

          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                  text: product.title,
                  fontSize: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              const SizedBox(
                height: 10,
              ),
                CustomText(
                  fontWeight: FontWeight.w600,
                  text: '\$ ${product.price}',
                  fontSize: 18,
                  color: Colors.grey),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              controller.manageFavorites(product.id);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ))
      ],
    );
  }
}
