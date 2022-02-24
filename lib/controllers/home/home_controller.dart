import 'dart:async';

import 'package:e_commerce/services/product_service.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  List<CategoryModel> _categoryModels = [];
  List<CategoryModel> get categoryModels => _categoryModels;

  List<ProductModel> _productsModels = [];
  List<ProductModel> get productsModels => _productsModels;
  @override
  void onInit() async {
    super.onInit();
    _categoryModels = [];
    _productsModels = [];
    await getCategoryItems();
    await getProductItems();
    isLoading = false;
    update();
  }

  Future<void> getCategoryItems() async {
    await ProductService.instance.getCategories().then((value) {
      if (value == null) return;
      _categoryModels = [];
      value.forEach((element) {
        _categoryModels.add(CategoryModel.fromJson(element.data()));
      });
    });
  }

  Future<void> getProductItems() async {
    await ProductService.instance.getProducts().then((value) {
      _productsModels = [];
      if (value == null) return;
      value.forEach((element) {
        _productsModels.add(ProductModel.fromJson(element.data()));
      });
    });
    update();
  }
}
