import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controllers/verify_controller.dart';
import 'package:ecommerce/data/color.dart';
import 'package:ecommerce/view/resetpassword.dart';
import 'package:ecommerce/second/success.dart';

class Verifyemail extends StatelessWidget {
  const Verifyemail({super.key,required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    // Verifycode controller =Get.put(Verifycode());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Verification'),
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
                  "Please, Enter you the code we have sent",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height:  MediaQuery.of(context).size.height/25,),
              Form(
                  child: Column(
                    children: [
                      OtpTextField(
                        numberOfFields: 5,
                        borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode){
                          Get.to(()=>title=="signin"?Success():Resetpassword());
                        }, // end onSubmit
                      ),

                      // TextFormField(
                      //   decoration: const InputDecoration(
                      //     suffixIcon: Icon(Icons.numbers_outlined),
                      //     label: Text("Code"),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      //     ),
                      //     errorBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       borderSide: BorderSide(color: Colors.red, width: 2.0),
                      //     ),
                      //     // hintText: 'Enter Password',
                      //   ),
                      //   showCursor: true,
                      // ),

                      SizedBox(
                        height:  MediaQuery.of(context).size.height/35,
                      ),
                    ],
                  )),
              // SizedBox(height:  MediaQuery.of(context).size.height/10,),
              SizedBox(height: 5,),
            ],
          )),
    );
  }
}
