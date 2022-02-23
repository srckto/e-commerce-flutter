import 'package:e_commerce/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  int _index = 0;
  int get index => _index;
  set index(int x) => _index = x;

  String? street1 = "";
  String? street2 = "";
  String? city = "";
  String? state = "";
  String? country = "";

  String? get address {
    return street1! + "," + street2! + "," + city! + "," + state! + "," + country!;
  }

  Delivery _delivery = Delivery.StandardDelivery;
  Delivery get delivery => _delivery;
  // set delivery(Delivery x) => _delivery = x;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValidated() {
    formKey.currentState!.save();
    return formKey.currentState!.validate();
  }

  void onChangeRadioButton(Delivery? value) {
    _delivery = value!;
    update();
  }

  Pages _pages = Pages.DeliveryTime;
  Pages get pages => _pages;

  void nextScreen() {
    _index++;
    if (_index == 0)
      _pages = Pages.DeliveryTime;
    else if (_index == 1) {
      _pages = Pages.AddAddress;
    } else if (_index == 2) {
      if (!isValidated()) {
        _index--;
      } else
        _pages = Pages.Summary;
    } else {
      Get.back();
      _index = 1;
    }
    update();
  }

  void prvScreen() {
    if (_index > 0) {
      _index--;
      if (_index == 0) _pages = Pages.DeliveryTime;
      if (_index == 1) _pages = Pages.AddAddress;
      if (_index == 2) _pages = Pages.Summary;
    }

    update();
  }
}
