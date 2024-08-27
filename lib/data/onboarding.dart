import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/data/color.dart';
import 'package:ecommerce/data/custombutton.dart';
import 'package:ecommerce/data/customslider.dart';
import 'package:ecommerce/data/dotcontroller.dart';
import 'package:ecommerce/data/onboarding_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top:20.0),
            child: Column(
                children: [
               Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children:  [
                      CustomDotControllerOnBoarding(),
                      Spacer(flex: 2),
                      CustomButtonOnBoarding()
                    ],
                  ))
            ]),
          ),
        ));
  }
}
