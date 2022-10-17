import 'package:get/get.dart';
import 'package:online_shop/view/screens/category.dart';
import 'package:online_shop/view/screens/favorite.dart';
import 'package:online_shop/view/screens/settings.dart';

import '../../view/screens/home.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
      HomeScreen(),
    const CategoryScreen(),
      FavoriteScreen(),
      const SettingsScreen(),
  ].obs;
  final title =[
    'Shop anything online',
    'Categories',
    'Favorites',
    'Settings'
  ].obs;


}
