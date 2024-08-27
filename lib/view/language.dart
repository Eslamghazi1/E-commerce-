import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/data/changelocal.dart';
import 'package:ecommerce/data/custombuttonlanguage.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("1".tr,style:
             const  TextStyle(fontSize: 24),),
           Custombuttonlanguage(name: "Ar",onPressed: (){
             controller.changelang("ar");
           },),
            Custombuttonlanguage(name: "En",onPressed: (){
              controller.changelang("en");
            },),
          ],
        ),
      ),
    );
  }
}
