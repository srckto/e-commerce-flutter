import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/account/user_products_controller.dart';
import 'package:e_commerce/controllers/main_user/main_user.dart';
import 'package:e_commerce/helper/hex_color.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  String? id;
  String? title;
  String? subTitle;
  String? image;
  String? description;
  Color color = k_primary;
  String? sized;
  String? price;
  String? category = "Men";
  String? publisher;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? imageFile;

  List<String> categoryItems = ["Men", "Women", "Devices", "Gadgets", "Gaming"];

  void onChangeCategoryDropButton(String value) {
    category = value;
    update();
  }

  void onColorChanged(Color changeColor) {
    color = changeColor;
    update();
  }

  Future<void> pickImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    imageFile = File(file.path);
    update();
  }

  Future<void> addProduct() async {
    if (!formKey.currentState!.validate()) return;
    if (imageFile == null) {
      Get.snackbar(
        "Wrong",
        "Please Select an image",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    isLoading = true;
    update();

    
    String imageUrl = await ProductService.instance.uploadImageToFireStorage(imageFile!);

    ProductModel model = ProductModel(
      id: "",
      title: title,
      subTitle: subTitle,
      description: description,
      price: int.parse(price!),
      sized: sized,
      category: category,
      color: HexColor(color).toHex(),
      publisher: MainUser.instance.model!.uid,
      image: imageUrl,
    );
    DocumentReference<Map<String, dynamic>> reference =
        await ProductService.instance.addProduct(model.toMap());
    await reference.update({"id": reference.id}).then((value) {
      model.id = reference.id;
    });

    isLoading = false;
    update();
    Get.find<UserProductsController>().onInit();
    Get.back();
  }
}
