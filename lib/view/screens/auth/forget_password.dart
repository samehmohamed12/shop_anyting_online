import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/auth_controller.dart';
import 'package:online_shop/view/widgets/custom_elevated_button.dart';
import 'package:online_shop/view/widgets/custom_text.dart';
import '../../../utils/my_string.dart';
import '../../../utils/themes.dart';
import '../../widgets/custom_text_form_filed.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
              fontWeight: FontWeight.bold,
              text: 'Forget Password',
              fontSize: 18,
              color: Get.isDarkMode ? mainColor : pinkClr),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                      fontWeight: FontWeight.normal,
                      text:
                          'if you want to recover your account, then please provide your email Id below..',
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.black : Colors.white),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormFiled(
                    color: Colors.grey.shade200,
                    controller: emailController,
                    prefixIcon: Get.isDarkMode
                        ? Image.asset('assets/images/email.png')
                        : const Icon(
                            Icons.email,
                            size: 30,
                            color: pinkClr,
                          ),
                    hintText: 'Email',
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return CustomElevatedButton(
                      text: 'SEND',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.resetPassword(emailController.text.trim());
                        }
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
