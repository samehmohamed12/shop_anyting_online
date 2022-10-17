import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/utils/themes.dart';
import 'package:online_shop/view/widgets/custom_text.dart';

class PaymentMethodeWidget extends StatefulWidget {
  const PaymentMethodeWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodeWidget> createState() => _PaymentMethodeWidgetState();
}

class _PaymentMethodeWidgetState extends State<PaymentMethodeWidget> {
  int radioContainerIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
            image: 'assets/images/paypal.png',
            name: 'Paypal',
            value: 1,
            scale: 0.7,
            onChanged: (value) {
              setState(() {
                radioContainerIndex = value;
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
            image: 'assets/images/google.png',
            name: 'Google Pay',
            value: 2,
            scale: 0.8,
            onChanged: (value) {
              setState(() {
                radioContainerIndex = value;
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
            image: 'assets/images/credit.png',
            name: 'Paypal',
            value: 3,
            scale: 0.7,
            onChanged: (value) {
              setState(() {
                radioContainerIndex = value;
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomText(
            fontWeight: FontWeight.bold,
            text: 'Total:200',
            fontSize: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {},
              child: const Text(
                'Pay Now',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required String name,
    required int value,
    required double scale,
    required Function onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomText(
                fontWeight: FontWeight.bold,
                text: name,
                fontSize: 25,
                color: Colors.black,
              )
            ],
          ),
          Radio(
            fillColor: MaterialStateColor.resolveWith(
                (states) => Get.isDarkMode ? pinkClr : mainColor),
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (value) => onChanged(value),
          )
        ],
      ),
    );
  }
}
