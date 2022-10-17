import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var favoriteList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  //search
  var searchList = <ProductModel>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    List? storedFavorite = storage.read<List>('isFavoritesList');
    if (storedFavorite != null) {
      favoriteList =
          storedFavorite.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Logic for favorite screen
  void manageFavorites(int productId) async {
    var existingIndex =
        favoriteList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoriteList.removeAt(existingIndex);
      await storage.remove('isFavoritesList');
    } else {
      favoriteList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write('isFavoritesList', favoriteList.obs());
    }
  }

  bool isFavorites(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  // search bar logic
  void addSearchToList(String searchName) {
    searchName=searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle=search.title.toLowerCase();
      return searchTitle.contains(searchName) ||
          search.price.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchController.clear();
    addSearchToList('');
  }
}
