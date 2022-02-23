import 'package:e_commerce/controllers/main_user/main_user.dart';
import 'package:e_commerce/screens/auth/login_screen.dart';
import 'package:e_commerce/screens/layout/layout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await MainUser.instance.getData();

    // await Future.delayed(Duration(seconds: 3));

    FirebaseAuth.instance.currentUser == null
        ? Get.offAll(() => LogInScreen())
        : Get.offAll(() => LayoutScreen());
  }
}
