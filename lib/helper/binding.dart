import 'package:e_commerce/controllers/account/account_controller.dart';
import 'package:e_commerce/controllers/account/add_product_controller.dart';
import 'package:e_commerce/controllers/account/edit_profile_controller.dart';
import 'package:e_commerce/controllers/account/user_products_controller.dart';
import 'package:e_commerce/controllers/auth/login_controller.dart';
import 'package:e_commerce/controllers/auth/register_controller.dart';
import 'package:e_commerce/controllers/cart/cart_controller.dart';
import 'package:e_commerce/controllers/check_out/check_out_controller.dart';
import 'package:e_commerce/controllers/home/home_controller.dart';
import 'package:e_commerce/controllers/layout/layout_controller.dart';
import 'package:e_commerce/controllers/splash/splash_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LayoutController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => CheckOutController());
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => UserProductsController());
    Get.lazyPut(() => AddProductController());
  }
}
