import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ecommerce/second/verifyemail.dart';

abstract class ForgetpasswordController extends GetxController{
  checkemail(String email);
  gotoVerfiyCode();
}

class Forgetpass extends ForgetpasswordController{
  @override
  gotoVerfiyCode() {
   Get.off(()=>Verifyemail(title: "reset",));
  }

  @override
  checkemail(String email) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    // Password reset email sent successfully
    } on FirebaseAuthException
    catch (e) {
    // Handle errors, such as invalid email or user not found
    print(e.message);
    }
    // try{
    //   print("you are here ");
    //   await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    // }catch (e){
    //   print("the error is :");
    //   print("$e");
    // }
  }

}
