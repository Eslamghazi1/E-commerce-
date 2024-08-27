import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce/data/services.dart';

class LocalController extends GetxController {
  Locale? laguage;
  MyServices myServices = Get.find();
  changelang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  void onInit() {
    super.onInit();
    if (myServices.sharedPreferences.getString("lang") == "ar")
      laguage = const Locale("ar");
    else laguage = myServices.sharedPreferences.getString("lang") == "en" ? const Locale("en") : Locale(Get.deviceLocale!.languageCode);
  }
}
