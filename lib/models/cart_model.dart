import 'package:e_commerce/constant.dart';

class CartModel {
  String? id, title, image;
  int? price, quantity;

  CartModel({
    this.id,
    this.title,
    this.image,
    this.price,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> data) {
    id = data[k_columnid];
    title = data[k_columnTitle];
    image = data[k_columnImage];
    price = data[k_columnPrice];
    quantity = data[k_columnQuantity];
  }

  Map<String, dynamic> toMap() {
    return {
      k_columnid: id,
      k_columnTitle: title,
      k_columnImage: image,
      k_columnPrice: price,
      k_columnQuantity: quantity,
    };
  }
}
