import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/cart_controller.dart';
import 'package:online_shop/logic/controller/category_controller.dart';
import 'package:online_shop/logic/controller/product_controller.dart';
import 'package:online_shop/view/screens/product_details.dart';
import 'package:online_shop/view/widgets/custom_text.dart';
import '../../../model/product_model.dart';
import '../../../utils/themes.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key, required this.nameCategory}) : super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();
  final String nameCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: CustomText(
            fontWeight: FontWeight.bold,
            text: nameCategory,
            fontSize: 20,
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Obx(() {
          if (categoryController.isAllCategory.value) {
            return Center(
                child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ));
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categoryController.categoryList.length,
              itemBuilder: (context, index) {
                return buildCardItems(categoryController.categoryList[index]);
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200,
              ),
            );
          }
        }));
  }

  Widget buildCardItems(ProductModel product) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
              product: product,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.manageFavorites(product.id);
                        },
                        icon: controller.isFavorites(product.id)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              )),
                    IconButton(
                        onPressed: () {
                          cartController.addProductToCart(product);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  product.image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                              fontWeight: FontWeight.bold,
                              text: product.rating.rate.toString(),
                              fontSize: 13,
                              color: Colors.white),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
