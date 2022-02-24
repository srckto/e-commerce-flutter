import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  bool isLoadingCategoryProducts = true;
  List<CategoryModel> _categoryModels = [];
  List<CategoryModel> get categoryModels => _categoryModels;

  List<ProductModel> _productsModels = [];
  List<ProductModel> get productsModels => _productsModels;

  List<ProductModel> _categoryResult = [];
  List<ProductModel> get categoryResult => _categoryResult;

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

  Future<void> getCategoryResult(String category) async {
    isLoadingCategoryProducts = true;

    _categoryResult = [];
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? response =
        await ProductService.instance.getProducts();
    if (response == null || response.isEmpty) return;
    response.forEach((element) {
      if (element.data()["category"] == category) {
        _categoryResult.add(ProductModel.fromJson(element.data()));
      }
    });
    isLoadingCategoryProducts = false;
    update();
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
