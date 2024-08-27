import 'package:ecommerce/controllers/coupon_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tracking extends StatelessWidget {
   Tracking({super.key});

  @override
  TextEditingController coupon=TextEditingController(text: "firstone");
  CouponControllerIMP controller=CouponControllerIMP();
  Widget build(BuildContext context) {
    return  Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      TextField(
        controller: coupon,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.email_outlined),
          label: Text("Email"),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide:
            BorderSide(color: Colors.blue, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide:
            BorderSide(color: Colors.grey, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide:
            BorderSide(color: Colors.red, width: 2.0),
          ),
          // hintText: 'Enter Email',
        ),
        showCursor: true,
      ),
        Text("Tracknig"),
        GetBuilder(
          init: controller,
            builder:(context)=> ElevatedButton(onPressed: ()async{
              FirebaseMessaging.instance.subscribeToTopic("topic");
            var instance=  await controller.getdata(coupon.text);
            if(instance["status"]=="fail"){
              print("some thing is worng");
            }else{
              if(DateTime.now().compareTo(DateTime.parse(instance["data"][0]["dateline"]))<1
                  && instance["data"][0]["count"]<101){
             var second=await   controller.edit(instance["data"][0]["id"].toString(), instance["data"][0]["count"]);
             print("your method is ${second["status"]}");
              }else {
                print("Your copon is expeired");
              }
            }
            }, child: Text(controller.test)))
      ],
    ));
  }
}
