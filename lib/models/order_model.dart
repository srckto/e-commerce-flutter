
import 'package:e_commerce/models/cart_model.dart';

class OrderModel {
  double? totalPrice;
  String? dateTime;
  String? deliveryTime;
  List<CartModel>? Carts = [];
  OrderModel({
    this.totalPrice,
    this.dateTime,
    this.deliveryTime,
    this.Carts,
  });

  OrderModel.fromJson(Map<String, dynamic> data) {
    totalPrice = data["totalPrice"];
    dateTime = data["dateTime"];
    deliveryTime = data["deliveryTime"];
    data["Carts"].forEach((element) {
      Carts!.add(CartModel.fromJson(element));
    });
  }

  Map<String, dynamic> toMap() {
    print(Carts);
    return {
      "totalPrice": totalPrice,
      "dateTime": dateTime,
      "deliveryTime": deliveryTime,
      "Carts": Carts!.map((element) {
       return element.toMap();
      }).toList(),
    };
  }
}
