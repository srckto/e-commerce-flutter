import 'package:e_commerce/screens/account/account_screen.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  List<BottomNavigationBarItem> items = [];
  List<Widget> screens = [];

  int currentIndex = 0;

  onInit() {
    super.onInit();
    initializingItem();
    initializingScreens();
  }

  void onChange(int index) {
    currentIndex = index;
    initializingItem();
    update();
  }

  void initializingScreens() {
    screens = [
      HomeScreen(),
      CartScreen(),
      AccountScreen(),
    ];
  }

  void initializingItem() {
    items = [
      BottomNavigationBarItem(
        icon: currentIndex == 0
            ? Text(
                "Explore",
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            : Image.asset("assets/images/Icon_Explore.png"),
        label: currentIndex == 0 ? "." : "",
      ),
      BottomNavigationBarItem(
        icon: currentIndex == 1
            ? Text(
                "Cart",
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            : Image.asset("assets/images/Icon_Cart.png"),
        label: currentIndex == 1 ? "." : "",
      ),
      BottomNavigationBarItem(
        icon: currentIndex == 2
            ? Text(
                "Account",
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            : Image.asset("assets/images/Icon_User.png"),
        label: currentIndex == 2 ? "." : "",
      ),
    ];
  }
}
