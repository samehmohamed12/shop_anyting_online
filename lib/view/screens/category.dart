import 'package:flutter/material.dart';
import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Column(
        children:   [
          CategoryWidget(),
        ],
      ),
    );
  }
}
