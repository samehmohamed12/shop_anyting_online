import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_shop/routes/routes.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

import 'auth/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                      child: CustomText(
                    fontWeight: FontWeight.bold,
                    text: 'Welcome',
                    fontSize: 35,
                    color: Colors.white,
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                      CustomText(
                        fontWeight: FontWeight.bold,
                        text: 'Anything Online',
                        fontSize: 25,
                        color: Get.isDarkMode?pinkClr: mainColor,
                      ),
                      const SizedBox(
                        width: 7.0,
                      ),
                      const CustomText(
                        fontWeight: FontWeight.bold,
                        text: 'Shop',
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Get.isDarkMode?pinkClr: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: const CustomText(
                      text: 'Get Start',
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                        fontWeight: FontWeight.normal,
                        text: 'Don\`t have an account?',
                        fontSize: 18,
                        color: Colors.white),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signupScreen);
                        },
                        child:   CustomText(
                          fontWeight: FontWeight.normal,
                          text: 'signup',
                          fontSize: 18,
                          color:Get.isDarkMode?pinkClr: mainColor,
                          textDecoration: TextDecoration.underline,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
