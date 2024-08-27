import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controllers/signup_controller.dart';
import 'package:ecommerce/data/color.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  final validator = GlobalKey<FormState>();
  SignupControllerIMP controller = Get.put(SignupControllerIMP());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign up'),
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: Container(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      "logos/main.png",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 5),
                ),
                width: 80,
                height: MediaQuery.of(context).size.height / 5,
                // color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Sign up with your name, email, phone number and your password or continue with social media",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Form(
                  key: validator,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 2 ||
                              value.contains(" ") == true) {
                            return "Enter a valid pass without spaces > 5";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.perm_contact_cal),
                          label: Text("Name"),
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
                          // hintText: 'Enter Password',
                        ),
                        showCursor: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              emil_check(value) == false) {
                            return "Enter a valid email  without spaces";
                          }
                          return null;
                        },
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: phone,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 6 ||
                              value.contains(" ") == true) {
                            return "Enter a valid pass without spaces > 5";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.phone),
                          label: Text("PHONE"),
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(20)),
                          //   borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          // ),
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
                          // hintText: 'Enter Password',
                        ),
                        showCursor: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      TextFormField(
                        controller: password,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 6 ||
                              value.contains(" ") == true) {
                            return "Enter a valid pass without spaces > 5";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          label: Text("Password"),
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
                          // hintText: 'Enter Password',
                        ),
                        showCursor: true,
                      ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: null,
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "logos/twitter.png",
                          ),
                        ),
                      ),
                      width: 40,
                      height: 40,
                      // color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    splashColor: null,
                    onTap: () async {
                      try {
                        await controller.SignUpWithGoogle();
                      } catch (_) {}
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "logos/google.png",
                          ),
                        ),
                      ),
                      width: 40,
                      height: 40,
                      // color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    splashColor: null,
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "logos/facebook.png",
                          ),
                        ),
                      ),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (validator.currentState!.validate()) {
                    try {
                      await controller.Signup(
                          "eslamghazi@gmail.com", "123456789"
                          // username.text,
                          // phone.text,
                          // 1234,
                          // 4567
                      );


                    } catch (_) {}
                  } else {
                    Get.snackbar(
                        "Enter the Four field correctly please", "Alert");
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
    );
  }
}

bool emil_check(String value) {
  if (value.contains("@gmail.com") && value.contains(" ") != true) {
    return true;
  }
  return false;
}
