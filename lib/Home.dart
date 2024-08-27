// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/controllers/login_controller.dart';
// import 'package:ecommerce/controllers/signup_controller.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ecommerce/controllers/request.dart';
import 'package:ecommerce/second/homepage.dart';
// import 'package:ecommerce/second/linkapi.dart';
import 'package:ecommerce/second/profile.dart';
import 'package:ecommerce/second/setting.dart';
import 'package:ecommerce/second/tracking.dart';
// import 'package:ecommerce/view/view_item.dart';
// import 'package:ecommerce/view/view_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'controllers/home_contorller.dart';
import 'main.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
    Home({super.key});
    homecontollerIMP controllers=Get.put(homecontollerIMP());

    TextEditingController search = TextEditingController();
    @override
    Widget build(BuildContext context) {

    return GetBuilder<homecontollerIMP>(
            init: controllers,
            builder:(context)=>
             Scaffold(
               appBar:AppBar(
                 actions: [TextButton(onPressed: (){
                   prefss.clear();
                   }, child: Text("Get out"))],
               ),
         body:   controllers.id==0?Homepage():controllers.id==1?const Setting():controllers.id==2?
         // controller.id==0?Homepage():controller.id==1?const Setting():controller.id==2?
         const Profile(): Tracking(),

        // floatingActionButton: FloatingActionButton(onPressed: (){},child: const Icon(Icons.add),),

        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            IconButton(
              color: controllers.id==0?Colors.deepOrange:null,
                onPressed: (){
              controllers.changepage(0);
            }, icon: const Icon(Icons.home)),
            IconButton(
                color: controllers.id==1?Colors.deepOrange:null,
                onPressed: (){
              controllers.changepage(1);
            }, icon: const Icon(Icons.settings)),
            IconButton(
                color: controllers.id==2?Colors.deepOrange:null,
                onPressed: (){
              controllers.changepage(2);
            }, icon: const Icon(Icons.person)),
            IconButton(
                color: controllers.id==3?Colors.deepOrange:null,
                onPressed: (){
              controllers.changepage(3);
            }, icon: const Icon(Icons.multitrack_audio)),
          ],),

       ),
    );
  }
}
