import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/check_out/check_out_controller.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
        init: CheckOutController(),
        builder: (controller) {
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Radio_Button.png"),
                          SizedBox(width: 10),
                          CustomText(text: "Billing address is the same as delivery address"),
                        ],
                      ),
                      SizedBox(height: 30),
                      CustomText(
                        text: "Street 1",
                        color: k_fontGrey,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        onSaved: (value) {
                          controller.street1 = value!;
                        },
                        decoration: InputDecoration(
                          hintText: "21, Alex Davidson Avenue",
                        ),
                        initialValue: controller.street1,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Please enter street 1";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomText(
                        text: "Street 2",
                        color: k_fontGrey,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        onSaved: (value) {
                          controller.street2 = value!;
                        },
                        decoration: InputDecoration(
                          hintText: "Opposite Omegatron, Vicent Quarters",
                        ),
                        initialValue: controller.street2,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Please enter street 2";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomText(
                        text: "City",
                        color: k_fontGrey,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        onSaved: (value) {
                          controller.city = value!;
                        },
                        decoration: InputDecoration(
                          hintText: "Victoria Island",
                        ),
                        initialValue: controller.city,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Please enter city";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "State",
                                  color: k_fontGrey,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  onSaved: (value) {
                                    controller.state = value!;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Lagos State",
                                  ),
                                  initialValue: controller.state,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) return "Please enter state";
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Country",
                                  color: k_fontGrey,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  onSaved: (value) {
                                    controller.country = value!;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Nigeria",
                                  ),
                                  initialValue: controller.country,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "Please enter country";
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
