import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/cart/cart_controller.dart';
import 'package:e_commerce/helper/cart_database_helper.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/models/order_model.dart';
import 'package:e_commerce/services/order_service.dart';
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

  bool isLoading = false;

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

  String getDelivery() {
    if (delivery == Delivery.NextDayDelivery) return "Next Day Delivery";
    if (delivery == Delivery.StandardDelivery) return "Standard Delivery";
    if (delivery == Delivery.NominatedDelivery) return "Nominated Delivery";
    return "";
  }

  void onChangeRadioButton(Delivery? value) {
    _delivery = value!;
    update();
  }

  Future<void> addOrderToFirebase() async {
    CartController cartController = Get.find<CartController>();

    OrderModel orderModel = OrderModel(
      totalPrice: cartController.totalPrice,
      dateTime: DateTime.now().toString(),
      Carts: cartController.allCarts,
      deliveryTime: getDelivery(),
    );
    await OrderService.instance.addOrder(orderModel);
  }

  Pages _pages = Pages.DeliveryTime;
  Pages get pages => _pages;

  void nextScreen() async {
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
      await addOrderToFirebase();
      await CartDatabaseHelper.instance.deleteTable(k_tableCart);
      Get.find<CartController>().onInit();
      Get.back();
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
