import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/themes.dart';
import '../../widgets/check_widget.dart';
import '../../widgets/container_under_widget.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_filed.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontSize: 25,
                              text: 'LOG',
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            CustomText(
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black
                               ,
                              fontSize: 25,
                              text: 'IN',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFormFiled(
                          color: Colors.grey.shade200,
                          controller: emailController,
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.email,
                                  size: 30,
                                  color: pinkClr,
                                )
                              : Image.asset('assets/images/email.png'),
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
                                ? const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: pinkClr,
                                  )
                                : Image.asset('assets/images/lock.png'),
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
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgetPasswordScreen);
                              },
                              child: CustomText(
                                  fontWeight: FontWeight.normal,
                                  text: 'Forgot Password?',
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CheckWidget(
                          text: 'Remember me',
                          underlineText: '',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomElevatedButton(
                          text: 'LOG IN',
                          onPressed: () {
                            if (controller.isCheckBox == false) {
                              Get.snackbar('Check Box',
                                  'Please, Accept terms & conditions',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white);
                            } else if (formKey.currentState!.validate()) {
                              controller.logInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                              controller.isCheckBox = true;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: AlignmentDirectional.center,
                            child: CustomText(
                                fontWeight: FontWeight.normal,
                                text: 'OR',
                                fontSize: 15,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Image.asset('assets/images/facebook.png'),
                              onTap: () {},
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                child: Image.asset('assets/images/google.png'),
                                onTap: () {
                                  controller.googleSignUp();
                                },
                              );
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnderWidget(
                text: 'Don`t have an Account?',
                textButton: 'Sign up',
                onPressed: () {
                  Get.offNamed(Routes.signupScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
