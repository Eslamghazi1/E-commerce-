import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/data/color.dart';
import 'package:ecommerce/data/onboarding_controller.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next() ; 
          },
          color: AppColor.primaryColor,
          child: const Text("Continue")),
    );
  }
}
