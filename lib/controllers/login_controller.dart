import 'package:ecommerce/Home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/second/verifyemail.dart';
import 'package:ecommerce/second/linkapi.dart';
import 'package:ecommerce/second/request.dart';

bool emil_check(String value) {
  if (value.contains("@gmail.com") && value.contains(" ") != true) {
    return true;
  }
  return false;
}
abstract class LoginController extends GetxController{
  // final _firebase = FirebaseAuth.instance;
 Future<void> login(String email,String pass);
  gotosignup();
  signInWithGoogle();
}
class LoginControllerIMP extends LoginController{
  @override
  gotosignup() {
  }
@override
  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override

  @override
  Future<void> login(String email, String pass)async {

           request instance=request();
            var response= await instance.postrequest(linklogin , {
              "email":email,
              "password":pass,
            });
            if(response!["status"]=="success"){
              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
              sharedPreferences.setInt("id", response["data"]["id"]);
              sharedPreferences.setString("email", response["data"]["email"]);
              sharedPreferences.setString("username", response["data"]["username"]);
              Get.offAll(()=>Home());
            }else {
              Get.snackbar("Fail to Sign in", "Email or the pass doesn't match");
            }



     //  print("success login ");
     // await FirebaseAuth.instance.currentUser!.emailVerified?
     // Get.to(()=>Verifyemail(title: "signin",));
  }


}