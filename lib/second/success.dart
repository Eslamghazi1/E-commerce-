import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/data/login.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
     const   Text("You have sign in successfully"),
        ElevatedButton(onPressed: (){
          Get.offAll(()=>Login(checker: "checker"));
        }, child:const Text("Go to login"))
      ],),),
    );
  }
}
