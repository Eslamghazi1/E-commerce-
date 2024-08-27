import 'package:get/get.dart';

class login_controller extends GetxController{
  bool memory=false;
  changed(bool value){
    memory=value;
    update();
  }
}
