import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/data/login.dart';
import 'package:ecommerce/data/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  confirm()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("onboarding", "true");
  }
  int currentPage = 0;

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
       confirm();
       Get.to(()=>Login(checker: "false",));
       // Get.offAllNamed(AppRoute.login) ;
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
