import 'package:e_commerce/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/check_out/check_out_controller.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/screens/check_out/widgets/add_address_widget.dart';
import 'package:e_commerce/screens/check_out/widgets/delevery_time_widget.dart';
import 'package:e_commerce/screens/check_out/widgets/summary_widget.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      init: CheckOutController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildHeader(index: controller.index),
              ),
              controller.pages == Pages.DeliveryTime
                  ? DeliveryTime()
                  : controller.pages == Pages.AddAddress
                      ? AddAddress()
                      : Summary(),
              Container(
                width: Get.width,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: Get.width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0.0,
                          side: BorderSide(
                            color: k_primary,
                            width: 1,
                          ),
                        ),
                        onPressed: () {
                          controller.prvScreen();
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: Get.width * 0.4,
                      child: CustomButton(
                        elevation: 0.0,
                        title: controller.pages == Pages.Summary ? "Deliver" : "Next",
                        onPress: () {
                          controller.nextScreen();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildHeader extends StatelessWidget {
  final int index;
  const _buildHeader({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 18),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: index == 0 ? k_primary : k_grey, width: 2),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: index >= 0 ? k_primary : Colors.white,
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: index >= 1 ? k_primary : k_grey,
                    // color: k_primary,
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: index == 1 ? k_primary : k_grey, width: 2),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: index >= 1 ? k_primary : Colors.white,
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: index >= 2 ? k_primary : k_grey,
                    // color: k_primary,
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: index == 2 ? k_primary : k_grey, width: 2),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: index >= 2 ? k_primary : Colors.white,
                ),
              ],
            ),
            SizedBox(width: 18),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Delivery", color: index >= 0 ? Colors.black : k_fontGrey),
            CustomText(text: "Address", color: index >= 1 ? Colors.black : k_fontGrey),
            CustomText(text: "Summer", color: index >= 2 ? Colors.black : k_fontGrey),
          ],
        ),
      ],
    );
  }
}
