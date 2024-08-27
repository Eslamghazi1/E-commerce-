import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathprovider;
import 'package:path/path.dart'as path;
import 'package:ecommerce/view/palce.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController{
  add_palce(String instance, File image, Location_class location);

}

class AddressControllerIMP extends AddressController{
  List state=[];
  @override
  void add_palce(String instance, File image, Location_class location) async{

  }


}
