import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{
  
  late SharedPreferences sharedPreferences;
  Future<MyServices>init()async{
     sharedPreferences =await SharedPreferences.getInstance();
     if((sharedPreferences.getString("memory")=="false"||sharedPreferences.getString("memory")==null)&&FirebaseAuth.instance.currentUser!=null)
     {
       FirebaseAuth.instance.signOut();
    }
    return this;
  }
  getdata()async{
    List data=[];
    data.add(sharedPreferences.getString("username")==null||sharedPreferences.getString("username")!.isEmpty?"":
    sharedPreferences.getString("username"));
    data.add(sharedPreferences.getString("email")==null||sharedPreferences.getString("email")!.isEmpty?"":
    sharedPreferences.getString("email"));
    data.add(sharedPreferences.getString("password")==null||sharedPreferences.getString("password")!.isEmpty?"":
    sharedPreferences.getString("password"));
    data.add(sharedPreferences.getString("phone")==null||sharedPreferences.getString("phone")!.isEmpty?"":
    sharedPreferences.getString("phone"));
    return data;
  }
}
  initalServices()async{
   await Get.putAsync(()=>MyServices().init());
  }
