import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/controllers/main_user/main_user.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:get/get.dart';

class UserProductsController extends GetxController {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  bool isLoading = true;

  onInit() async {
    super.onInit();
    _products = [];
    await getProducts();
    isLoading = false;
    update();
  }

  Future<void> getProducts() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? response =
        await ProductService.instance.getProducts();
    if (response == null) return;
    response.forEach((element) {
      if (element.data()["publisher"] == MainUser.instance.model!.uid) {
        _products.add(ProductModel.fromJson(element.data()));
      }
    });
  }
}
