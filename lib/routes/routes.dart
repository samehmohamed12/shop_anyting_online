import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:online_shop/logic/bindings/auth_binding.dart';
import 'package:online_shop/logic/bindings/main_binding.dart';
import 'package:online_shop/logic/bindings/product_binding.dart';
import 'package:online_shop/view/screens/auth/forget_password.dart';
import 'package:online_shop/view/screens/auth/login.dart';
import 'package:online_shop/view/screens/auth/signup.dart';
import 'package:online_shop/view/screens/cart.dart';
import 'package:online_shop/view/screens/main.dart';
import 'package:online_shop/view/screens/payment.dart';

import '../view/screens/product_details.dart';
import '../view/screens/welcome.dart';

class AppRoutes {
  // initial route
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  // get pages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.signupScreen,
        page: () => SignupScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () =>   CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () =>   const PaymentScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),

  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
