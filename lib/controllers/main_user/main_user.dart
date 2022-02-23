import 'dart:convert';

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainUser {
  MainUser._privateConstructor();

  static final MainUser instance = MainUser._privateConstructor();

  UserModel? model;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> getData() async {
    if (_auth.currentUser == null) {
      return null;
    }
    var localStorageData = await LocalStorageData.instance.getData(k_keyUserStorage);
    if (localStorageData == null) {
      model = await AuthService.instance.getUserFromFireStore(_auth.currentUser!.uid);
      await LocalStorageData.instance.save(k_keyUserStorage, jsonEncode(model!.toMap()));
    } else {
      model = UserModel.fromJson(jsonDecode(localStorageData));
    }

    return model;
  }
}
