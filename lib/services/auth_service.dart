import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  AuthService._privateConstructor();

  static final AuthService instance = AuthService._privateConstructor();

  User? _auth = FirebaseAuth.instance.currentUser;

  Future<void> addUserToFireStore(UserModel model) async {
    await FirebaseFirestore.instance.collection("users").doc(model.uid).set(model.toMap());
  }

  Future<UserModel?> getUserFromFireStore(String uid) async {
    UserModel? model;
    await FirebaseFirestore.instance.collection("users").get().then((value) {
      value.docs.forEach((element) {
        if (element.id == uid) {
          model = UserModel.fromJson(element.data());
        }
      });
    });
    return model;
  }

  Future<void> updateUserData(UserModel model) async {
    await FirebaseFirestore.instance.collection("users").doc(model.uid).update(model.toMap());
  }

  Future<String> uploadImageToFireStorage(File file) async {
    Reference reference = await FirebaseStorage.instance
        .ref()
        .child("users/${_auth!.uid}/${file.path.split("/").last}");
    await reference.putFile(file);
    return await reference.getDownloadURL();
  }
}
