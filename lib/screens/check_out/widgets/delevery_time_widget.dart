import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/check_out/check_out_controller.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CheckOutController>(
          init: CheckOutController(),
          builder: (controller) {
            return Column(
              children: [
                SizedBox(height: 30),
                RadioListTile<Delivery>(
                  activeColor: k_primary,
                  title: CustomText(
                    text: "Standard Delivery",
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: CustomText(
                    text: "Order will be delivered between 3 - 5 business days",
                    fontSize: 15,
                  ),
                  value: Delivery.StandardDelivery,
                  groupValue: controller.delivery,
                  onChanged: controller.onChangeRadioButton,
                ),
                SizedBox(height: 20),
                RadioListTile<Delivery>(
                  activeColor: k_primary,
                  title: CustomText(
                    text: "Next Day Delivery",
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: CustomText(
                    text:
                        "Place your order before 6pm and your items will be delivered the next day",
                    fontSize: 15,
                  ),
                  value: Delivery.NextDayDelivery,
                  groupValue: controller.delivery,
                  onChanged: controller.onChangeRadioButton,
                ),
                SizedBox(height: 20),
                RadioListTile<Delivery>(
                  activeColor: k_primary,
                  title: CustomText(
                    text: "Nominated Delivery",
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: CustomText(
                    text:
                        "Pick a particular date from the calendar and order will be delivered on selected date",
                    fontSize: 15,
                  ),
                  value: Delivery.NominatedDelivery,
                  groupValue: controller.delivery,
                  onChanged: controller.onChangeRadioButton,
                ),
              ],
            );
          }),
    );
  }
}
