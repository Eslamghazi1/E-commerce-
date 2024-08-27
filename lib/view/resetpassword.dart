import 'package:ecommerce/data/color.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/color.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forget password'),
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Enter the new password",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.lock),
                      label: Text("password"),
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
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                ],
              )),
              // SizedBox(height:  MediaQuery.of(context).size.height/10,),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                child: const Text(
                  "Check",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
    );
  }
}
