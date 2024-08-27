// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce/second/verifyemail.dart';
import 'package:ecommerce/second/linkapi.dart';
import 'package:ecommerce/second/request.dart';
import 'package:ecommerce/second/success.dart';

abstract class SignupController extends GetxController{
  Future<void>  Signup(String email,
      String pass,
      // String username,
      // String phone,
      // int verfiycode,
      // int approve
      );
  Future<UserCredential>  SignUpWithGoogle();
  // final _firebase = FirebaseAuth.instance;
}

class SignupControllerIMP extends SignupController{

  gotosignup() {
  }
  @override
  Future<UserCredential> SignUpWithGoogle() async {
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
  Future <void> Signup(
      String email,
      String pass,
      // String username,
      // String phone,
      // int verfiycode,
      // int approve,
      )async {
        // request instance=request();
        // try {
        //   print(email);
        //   var response = await instance.postrequest(linksignup, {
        //     "username": username,
        //     "email": email.trim(),
        //     "password": pass,
        //     "verfiycode":verfiycode.toString(),
        //     "phone":phone,
        //     "approve":approve.toString(),
        //   });
        //   print("the response is :$response");
        //   if (response!["status"] == "success") {
        //     Get.off(() => Success());
        //   } else {
        //     if (response["status"] == "fail")
        //       Get.snackbar("Fail to Sign up", response["status"].toString());
        //     else
        //       Get.snackbar("Fail to Sign up", response["status"].toString());
        //   }
        // }catch(e){
        //   Get.snackbar( "failed" , "Signup failed Alert");
        // }
try{
      final UserCredential usercreated =
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email,
          password: pass);
    // await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(usercreated.user!.uid)
          .set({
        // "username": username,
        "email": email,
        "password":pass,
        // "phone":phone,
      });
      Get.to(()=>Verifyemail(title: "signin",));
    } on FirebaseAuthException catch (e) {
     Get.snackbar(e.message ?? "failed" , "Signup Alert");
    }
  }


}
