import 'package:get/get.dart';

abstract class CategoryController extends GetxController{
  getdata();
  changepage(int page);
  initial(int first);
}

class CategoryControllerIMP extends CategoryController{
  int id=0;
  int cat=0;
  @override
  getdata() {

  }

  @override
  changepage(int page) {
    cat=page;
    update();
  }

  @override
  initial(int first) {
   cat=first;
   update();
  }

}
