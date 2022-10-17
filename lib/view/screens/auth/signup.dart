import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/auth_controller.dart';
import 'package:online_shop/utils/my_string.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text_form_filed.dart';
import '../../../routes/routes.dart';
import '../../widgets/check_widget.dart';
import '../../widgets/container_under_widget.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              fontSize: 25,
                              text: 'SIGN',
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            CustomText(
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              fontSize: 25,
                              text: 'UP',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFormFiled(
                          color: Colors.grey.shade200,
                          controller: nameController,
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : const Icon(
                                  Icons.person,
                                  size: 30,
                                  color: pinkClr,
                                ),
                          hintText: 'User Name',
                          obscureText: false,
                          textInputType: TextInputType.name,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
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
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return CustomTextFormFiled(
                            color: Colors.grey.shade200,
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                            controller: passwordController,
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: pinkClr,
                                  ),
                            hintText: 'Password',
                            obscureText: controller.isVisibility ? false : true,
                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value.toString().length <= 6) {
                                return 'Password should be longer or equal to 6 character';
                              } else {
                                return null;
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        CheckWidget(
                          text: 'I accept ',
                          underlineText: 'terms & conditions',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return CustomElevatedButton(
                            text: 'SIGN UP',
                            onPressed: () {
                              if (controller.isCheckBox == false) {
                                Get.snackbar('Check Box',
                                    'Please, Accept terms & conditions',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              } else if (formKey.currentState!.validate()) {
                                controller.signUpWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    name: nameController.text.trim(),
                                    password: passwordController.text);
                                controller.isCheckBox = true;
                              }
                            },
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnderWidget(
                text: 'Already have an Account?',
                textButton: 'Log in',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
