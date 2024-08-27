import 'package:ecommerce/controllers/favourite_cotroller.dart';
import 'package:ecommerce/data/login.dart';
import 'package:ecommerce/data/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'firebase_options.dart';

// ...
late SharedPreferences prefss;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefss= await SharedPreferences.getInstance();
  final controller = Get.put(FavouriteControllerIMP());
   await controller.viewfavourite();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userStream = FirebaseAuth.instance.authStateChanges(); // Stream
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:OnBoarding(),
    );
  }
}

//01159411105