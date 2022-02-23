import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/controllers/account/account_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/main_user/main_user.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/services/auth_service.dart';

class EditProfileController extends GetxController {
  bool isLoading = true;
  UserModel? userModel;
  String newPassword = "";
  String reEnterNewPassword = "";
  String oldPassword = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  File? imageFile;
  String name = "";
  String phoneNumber = "";

  @override
  void onInit() async {
    isLoading = true;
    super.onInit();
    userModel = await MainUser.instance.getData();
    name = userModel!.name;
    phoneNumber = userModel!.phone.toString();
    isLoading = false;
    update();
  }

  Future<void> changePassword() async {
    if (!passwordFormKey.currentState!.validate()) return;

    try {
      User? user = FirebaseAuth.instance.currentUser;
      AuthCredential credential =
          await EmailAuthProvider.credential(email: userModel!.email, password: oldPassword);

      UserCredential userCredential = await user!.reauthenticateWithCredential(credential);
      await userCredential.user!.updatePassword(newPassword);
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Wrong",
        e.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> pickImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    imageFile = File(file.path);
    update();
  }

  Future<String> uploadImage() async {
    return await AuthService.instance.uploadImageToFireStorage(imageFile!);
  }

  Future<void> updateData() async {
    String? url;
    if (imageFile != null) url = await uploadImage();

    UserModel model = UserModel(
      uid: userModel!.uid,
      email: userModel!.email,
      name: name,
      picture: (url == null ? userModel!.picture : url),
      isPublisher: userModel!.isPublisher,
      phone: int.parse(phoneNumber),
    );

    await AuthService.instance.updateUserData(model);
    await LocalStorageData.instance.save(k_keyUserStorage, jsonEncode(model.toMap()));
    Get.find<AccountController>().onInit();
    Get.back();
  }
}
