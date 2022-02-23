
import 'package:e_commerce/controllers/main_user/main_user.dart';
import 'package:e_commerce/helper/binding.dart';
import 'package:e_commerce/screens/layout/layout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  String email = "";
  String password = "";
  bool isLoading = false;

  Future<UserCredential> signInWithGoogle() async {
    try {
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
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<String?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     UserCredential userCredential = await _auth.signInWithCredential(credential);
  //     print("////////////////////////////////////////////");
  //     print(userCredential.user);
  //     print(userCredential.user!.uid);
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //     throw e;
  //   }
  // }

  Future signInWithEmail() async {
    try {
      isLoading = true;
      update();

      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: this.email, password: this.password);
      await MainUser.instance.getData();
      // await LocalStorageData.instance.save(k_keyUserStorage, jsonEncode(model!.toMap()));
      
      isLoading = false;
      update();
      Get.offAll(() => LayoutScreen(), binding: Binding());
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      update();

      print(e.message);
      Get.closeAllSnackbars();
      Get.snackbar(
        "Error",
        e.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      isLoading = false;
      update();

      print(e.toString());
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print(e.toString());
    }
  }
}
