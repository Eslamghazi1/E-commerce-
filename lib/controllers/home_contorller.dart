import 'package:get/get.dart';

abstract class HomeContorller extends GetxController{

  changepage(int page);
}

class homecontollerIMP extends HomeContorller{
  int id=3;

  @override
  changepage(int page) {
    id=page;
    update();
  }

}
