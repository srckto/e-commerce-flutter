import 'package:e_commerce/controllers/layout/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutScreen extends GetWidget<LayoutController> {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LayoutController>(
        builder: (_) => Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.screens,
          ),
          // body: controller.screens[controller.currentIndex],
          bottomNavigationBar: Container(
            height: 70,
            child: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              // fixedColor: Colors.white,
              currentIndex: controller.currentIndex,
              onTap: controller.onChange,
              items: controller.items,
              selectedItemColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
