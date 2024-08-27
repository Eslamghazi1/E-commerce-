import 'package:ecommerce/controllers/request.dart';
import 'package:ecommerce/second/linkapi.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController{
  getdata(String name);
  edit(String id ,int count);
}

class CheckoutControllerIMP extends CheckoutController{
  String test="No coupon yet!!";
  @override
  getdata(String name)async {
    request instance =request();
    var response= await instance.postrequest(
        coupon_view, {"name":name});

    return response;


  }

  edit(String id ,int count)async{
    request instance =request();
    var response= await instance.postrequest(
        coupon_edit, {"id":id,
      "count":(count+1).toString()});
    return response;
  }

}
