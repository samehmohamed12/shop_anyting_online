import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

import '../../utils/themes.dart';
import '../widgets/payment/delivery_container_widget.dart';
import '../widgets/payment/payment_methode_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        title: const Text('Payment'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fontWeight: FontWeight.bold,
                text: "Shopping to",
                fontSize: 24,
                color: Get.isDarkMode?Colors.white:Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                fontWeight: FontWeight.bold,
                text: "Payment methode",
                fontSize: 24,
                color: Get.isDarkMode?Colors.white:Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
             PaymentMethodeWidget(),
              const SizedBox(
                height: 30,
              ),
              // Total Button
            ],
          ),
        ),
      ),
    );
  }
}
