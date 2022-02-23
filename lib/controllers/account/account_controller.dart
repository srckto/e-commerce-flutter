
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/main_user/main_user.dart';
import 'package:e_commerce/helper/cart_database_helper.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  bool isLoading = true;
  UserModel? userModel;

  @override
  void onInit() async {
    isLoading = true;
    super.onInit();
    userModel = await MainUser.instance.getData();
    isLoading = false;
    update();
  }

  void singOut() async {
    await FirebaseAuth.instance.signOut();
    await CartDatabaseHelper.instance.deleteTable(k_tableCart);
    await LocalStorageData.instance.delete(k_keyUserStorage);
    Get.offAll(() => LogInScreen());
  }
}
