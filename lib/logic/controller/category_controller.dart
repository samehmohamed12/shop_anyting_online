import 'package:get/get.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/services/category_services.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModel>[].obs;
  var isAllCategory = false.obs;
  List<String> imageCategory = [
    'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',
    'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
    'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg',
  ];

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    var category = await CategoryServices.getCategory();
    try {
      isLoading(true);
      if (category.isNotEmpty) {
        categoryNameList.addAll(category);
      }
    } finally {
      isLoading(false);
    }
  }

    getAllCategory(String categoryNames) async {
    isAllCategory(true);
    categoryList.value =
        await AllCategoryServices.getAllCategory(categoryNames);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var category = await getAllCategory(categoryNameList[index]);
    if (category.isNotEmpty) {
      categoryList.value = category;
    }
  }
}
