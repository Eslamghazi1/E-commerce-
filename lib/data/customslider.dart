import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/data/onboarding_controller.dart';
import 'package:ecommerce/data/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Image.asset(
                  onBoardingList[i].image!,
                  // width: ,
                  // height: 230,
                  // fit: BoxFit.fill,
                ),
                const SizedBox(height: 80),
                Text(onBoardingList[i].title!,
                    // style: Theme.of(context).textTheme.headline1
                ),
                const SizedBox(height: 20),
          
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      // style: Theme.of(context).textTheme.bodyText1,
                    )),
              ],
            ));
  }
}
