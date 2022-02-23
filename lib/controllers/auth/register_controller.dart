import 'dart:convert';

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/helper/binding.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/controllers/main_user/main_user.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/screens/layout/layout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  String name = "";
  String email = "";
  String password = "";
  String rePassword = "";
  bool isLoading = false;
  int? phoneNumber = 0;

  Future registerWithEmailAndPassword() async {
    try {
      isLoading = true;
      update();
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: this.email,
        password: this.password,
      );

      UserModel model = UserModel(
        email: this.email,
        name: this.name,
        picture:
            'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',
        uid: userCredential.user!.uid,
        isPublisher: false,
        phone: phoneNumber!,
      );

      await AuthService.instance.addUserToFireStore(model);
      await MainUser.instance.getData();
      await LocalStorageData.instance.save(k_keyUserStorage, jsonEncode(model.toMap()));
      isLoading = false;
      update();

      Get.offAll(() => LayoutScreen(), binding: Binding());
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      update();

      print(e.message);
      Get.snackbar("Error", e.message!);
    } catch (e) {
      isLoading = false;
      update();

      print(e);
    }
  }
}
