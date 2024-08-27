import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controllers/forgetpass.dart';
import 'package:ecommerce/data/color.dart';

class Forgetpassword extends StatelessWidget {
   Forgetpassword({super.key});
  TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Forgetpass controller =Get.put(Forgetpass());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forget password'),
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: Container(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20),
          child: ListView(
            children: [

              const  SizedBox(
                height: 10,
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Enter you email to check",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height:  MediaQuery.of(context).size.height/25,),
              Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.email),
                          label: Text("Name"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.red, width: 2.0),
                          ),
                          // hintText: 'Enter Password',
                        ),
                        showCursor: true,
                      ),
                      SizedBox(
                        height:  MediaQuery.of(context).size.height/35,
                      ),
                    ],
                  )),
              // SizedBox(height:  MediaQuery.of(context).size.height/10,),
              SizedBox(height: 5,),
              ElevatedButton(
                onPressed: () {
                  controller.checkemail(email.text);
                  controller.gotoVerfiyCode();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.deepOrange
                ),
                child:const Text("Check",style: TextStyle(color: Colors.black),),
              ),
            ],
          )),
    );
  }
}
