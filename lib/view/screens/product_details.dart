import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/model/product_model.dart';
import '../widgets/product_details/add_cart.dart';
import '../widgets/product_details/clothes_info.dart';
import '../widgets/product_details/image_sliders.dart';
import '../widgets/product_details/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlidersWidget(
              imageUrl: product.image,
            ),
            ClothesInfo(
              title: product.title,
              idProduct: product.id,
              rate: product.rating.rate,
              description: product.description,
            ),
            const SizeList(),
              AddCart(product: product,),

          ],
        ),
      ),
    );
  }
}
