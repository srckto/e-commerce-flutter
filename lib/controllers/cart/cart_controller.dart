import 'package:e_commerce/helper/cart_database_helper.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  @override
  onInit() async {
    super.onInit();
    await getAllProduct();
    await getTotalPrice();
    update();
  }

  List<CartModel> _allCarts = [];
  List<CartModel> get allCarts => _allCarts;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  void addProduct(CartModel model) async {
    for (int i = 0; i != _allCarts.length; i++) {
      if (_allCarts[i].id == model.id) return;
    }

    await CartDatabaseHelper.instance.insert(model);
    await getAllProduct();
    await getTotalPrice();
    update();
  }

  Future<void> getAllProduct() async {
    List<Map<String, Object?>>? value = await CartDatabaseHelper.instance.getAllProduct();
    if (value == null) return;
    _allCarts = [];
    value.forEach((element) {
      _allCarts.add(CartModel.fromJson(element));
    });
    update();
  }

  Future<void> getTotalPrice() async {
    if (_allCarts.isEmpty) return;
    _totalPrice = 0;
    _allCarts.forEach((element) {
      _totalPrice += element.price! * element.quantity!;
    });
    print(_totalPrice);
  }

  Future<void> increaseQuantity(CartModel model) async {
    if (model.quantity! >= 1) {
      model.quantity = model.quantity! + 1;
      await CartDatabaseHelper.instance.update(model);
      await getTotalPrice();
    }
    update();
  }

  Future<void> decreaseQuantity(CartModel model) async {
    if (model.quantity! > 1) {
      model.quantity = model.quantity! - 1;
      await CartDatabaseHelper.instance.update(model);
      // await CartDatabaseHelper.instance.deleteTable(k_tableCart);
      await getTotalPrice();
    }
    update();
  }
}
