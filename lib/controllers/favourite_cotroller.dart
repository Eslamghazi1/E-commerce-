import 'package:ecommerce/controllers/request.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/second/linkapi.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavouriteController extends GetxController{
  addfavourite(String item);
  deletefavourite(String id);
  viewfavourite();
  check(String item);
}


class FavouriteControllerIMP extends FavouriteController {
  String users_ID = prefss.getInt("id").toString();
  List favourite = [];
  int index=3;

  @override
  addfavourite(String item_id) async {
    request instance = request();
    await instance.postrequest(favourite_add, {"user_id": users_ID,
      "item_id": item_id,
    });
   await viewfavourite();
    update();
  }

  @override
  deletefavourite(String id) async {
    if (favourite.isNotEmpty) {
      var fav = favourite.where((element) {
        return (element["user_id"].toString() == users_ID &&
            element["item_id"].toString() == id);
      }).toList();
      if (fav.isNotEmpty) {
        request instance = request();
        await instance.postrequest(favourite_delete, {"id": fav[0]["id"].toString(),
        });
      }
    }
   await viewfavourite();
    update();
  }

  @override
  viewfavourite() async {
    request instance = request();
    var response = await instance.postrequest(favourite_view, {});
    if (response!["status"] != "Fail") {
      favourite = response["data"];
    }
    if(favourite.isNotEmpty){

    }
    update();
  }

  check(String item) async {
    if (favourite.isNotEmpty) {
      var fav = favourite.where((element) {
        return (element["user_id"].toString() == users_ID &&
            element["item_id"].toString() == item);
      }).toList();
      if (fav.isNotEmpty) {
        return true;
      }
    }

    return false;
  }

}