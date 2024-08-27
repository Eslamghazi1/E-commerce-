import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/data/color.dart';
import 'package:ecommerce/view/forgetpassword.dart';
import 'package:ecommerce/data/login_controller.dart';
import 'package:ecommerce/data/signup.dart';

import '../controllers/login_controller.dart';
import '../second/dialog.dart';

class Login extends StatelessWidget {
  Login({Key? key,required this.checker}) : super(key: key);
  String checker;
  bool memory = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final validator = GlobalKey<FormState>();

  LoginControllerIMP controller = Get.put(LoginControllerIMP());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign in'),
        backgroundColor: AppColor.backgroundcolor,
      ),
      body:WillPopScope(
        onWillPop: exitdialog,
        child: Container(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
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
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Sign in with you email and your password or continue with social media",
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 24,
                ),
                Form(
                    key: validator,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                emil_check(value) == false) {
                              return "Enter a valid email  without spaces";
                            }
                            return null;
                          },
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 34,
                        ),
                        TextFormField(
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.emailAddress,
                          controller: password,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 6 ||
                                value.contains(" ") == true) {
                              return "Enter a valid pass without spaces > 5";
                            }
                            return null;
                          },
                          // textCapitalization: TextCapitalization.none,
                          obscureText: true,
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
                  height: MediaQuery.of(context).size.height / 29,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            GetBuilder<login_controller>(
                                init: login_controller(),
                                builder: (controller) => Checkbox(
                                    value: controller.memory,
                                    onChanged: (value)async {
                                      controller.changed(value!);
                                      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                                      value==false?sharedPreferences.setString("memory", "false"):
                                      sharedPreferences.setString("memory", "true");
                                    })),
                            const Text("Remember me"),
                          ],
                        )),
                    TextButton(
                        onPressed: () {
                          Get.off(() => Forgetpassword());
                        },
                        child: const Text(
                          "Forget Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 34,
                ),
                // SizedBox(height:  MediaQuery.of(context).size.height/6,),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 54,
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
                      onTap: () async {
                        try {
                          await controller.signInWithGoogle();
                        } catch (_) {}
                      },
                      splashColor: null,
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
                      onTap: () {},
                      splashColor: null,
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
                  height: MediaQuery.of(context).size.height / 90,
                ),
                ElevatedButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (validator.currentState!.validate()) {
                      try {
                        await controller.login(email.text, password.text);
                      } catch (_) {}
                    } else {
                      Get.snackbar(
                          "Enter the two field correctly please", "Alert");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("You don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => Signup());
                      },
                      // color: Colors.deepOrange,
                      child: const Text("Sign up"),
                    ),
                  ],
                ),
              ],
            )),
      )

    );
  }
}

bool emil_check(String value) {
  if (value.contains("@gmail.com") && value.contains(" ") != true) {
    return true;
  }
  return false;
}
