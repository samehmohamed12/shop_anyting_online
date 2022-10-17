import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/logic/controller/auth_controller.dart';
import 'package:online_shop/logic/controller/payment_controller.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';
import 'package:online_shop/view/widgets/custom_text_form_filed.dart';

import '../../../routes/routes.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;
  final TextEditingController phoneController = TextEditingController();
  final controller=Get.find<PaymentController>();
  final authController=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            color: changeColor ? Colors.white : Colors.grey.withOpacity(0.3),
            onChange: (value) {
              setState(() {
                radioContainerIndex = value;
                changeColor = !changeColor;
              });
            },
            value: 1,
            title: 'Shop anything online',
            name: authController.displayUserName.value,
            phone: '01006945823',
            address: 'cairo,egypt'),
        const SizedBox(
          height: 10,
        ),
       Obx(() =>  buildRadioContainer(
           icon: InkWell(
             onTap: () {
               Get.defaultDialog(
                   content: Padding(
                     padding: const EdgeInsets.all(15),
                     child: CustomTextFormFiled(
                       maxLength: 11,
                       color: Get.isDarkMode
                           ? pinkClr.withOpacity(0.1)
                           : mainColor.withOpacity(0.2),
                       suffixIcon: IconButton(
                           onPressed: () {
                             phoneController.clear();
                           },
                           icon: const Icon(
                             Icons.close,
                             color: Colors.black,
                           )),
                       controller: phoneController,
                       prefixIcon: Icon(
                         Icons.phone,
                         color: Get.isDarkMode ? pinkClr : mainColor,
                       ),
                       hintText: 'Enter Your Phone Number',
                       obscureText: false,
                       textInputType: TextInputType.phone,
                       validator: () {},
                     ),
                   ),
                   buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                   onConfirm: () {
                     controller.phoneNumber.value=phoneController.text;
                     Get.back();
                   },
                   onCancel: () {
                     Get.toNamed(Routes.paymentScreen);
                   },
                   backgroundColor: Colors.white,
                   radius: 10,
                   textCancel: 'Cancel',
                   cancelTextColor: Colors.black,
                   confirmTextColor: Colors.white,
                   textConfirm: ' Save ',
                   title: 'Enter Your Phone Number',
                   titleStyle: const TextStyle(
                     fontSize: 16,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ));
             },
             child: Icon(
               Icons.contact_phone,
               size: 20,
               color: Get.isDarkMode ? pinkClr : mainColor,
             ),
           ),
           color: changeColor ? Colors.grey.withOpacity(.3) : Colors.white,
           onChange: (value) {
             setState(() {
               radioContainerIndex = value;
               changeColor = !changeColor;
             });
             controller.updatePosition();
           },
           value: 2,
           title: 'Delivery',
           name: authController.displayUserName.value,
           phone: controller.phoneNumber.value,
           address:controller.address.value),)
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChange,
    required String title,
    required String name,
    required String address,
    required String phone,
    Widget? icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: value,
              groupValue: radioContainerIndex,
              onChanged: (value) => onChange(value),
              fillColor: MaterialStateColor.resolveWith(
                (states) =>Get.isDarkMode?pinkClr: mainColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      fontWeight: FontWeight.bold,
                      text: title,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      fontWeight: FontWeight.bold,
                      text: name,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text('🇪🇬+20 '),
                        CustomText(
                          fontWeight: FontWeight.bold,
                          text: phone,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        SizedBox(
                          child: icon,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        fontWeight: FontWeight.bold,
                        text: address,
                        fontSize: 15,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,

                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
