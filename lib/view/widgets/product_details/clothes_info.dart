import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/product_controller.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.idProduct,
      required this.rate,
      required this.description})
      : super(key: key);
  final String title;
  final String description;
  final int idProduct;
  final double rate;
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    text: title,
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              Obx(() => InkWell(
                    onTap: () {
                      controller.manageFavorites(idProduct);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? Colors.white.withOpacity(.9)
                            : Colors.grey.withOpacity(.4),
                        shape: BoxShape.circle,
                      ),
                      child: controller.isFavorites(idProduct)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 20,
                            ),
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              CustomText(
                fontWeight: FontWeight.bold,
                text: rate.toString(),
                fontSize: 14,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(
                width: 5,
              ),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            trimMode: TrimMode.Line,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              height: 1.7,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
