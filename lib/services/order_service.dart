import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/controllers/main_user/main_user.dart';
import 'package:e_commerce/models/order_model.dart';

class OrderService {
  OrderService._privateConstructor();

  static final OrderService instance = OrderService._privateConstructor();

  Future<void> addOrder(OrderModel model) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(MainUser.instance.model!.uid)
        .collection("orders")
        .add(model.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getOrders() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(MainUser.instance.model!.uid)
        .collection("orders").orderBy("dateTime")
        .get();
  }
}
