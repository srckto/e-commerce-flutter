import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/Camera Image.png",
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: k_primary,
                ),
                SizedBox(height: 10),
                Text(
                  "Loading...",
                  style: Theme.of(context).textTheme.button!.copyWith(fontSize: 22),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
