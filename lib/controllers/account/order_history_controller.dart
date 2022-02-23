import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/order_model.dart';
import 'package:e_commerce/services/order_service.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  List<OrderModel> _orders = [];
  List<OrderModel> get orders => _orders;
  bool isLoading = true;

  @override
  void onInit() async {
    super.onInit();
    _orders = [];
    await getOrders();
    isLoading = false;
    update();
  }

  Future<void> getOrders() async {
    QuerySnapshot<Map<String, dynamic>> response = await OrderService.instance.getOrders();
    response.docs.forEach((element) {
      _orders.add(OrderModel.fromJson(element.data()));
    });
  }
}
