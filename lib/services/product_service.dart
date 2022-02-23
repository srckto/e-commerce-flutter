import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductService {
  ProductService._privateConstructor();

  static final ProductService instance = ProductService._privateConstructor();

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getCategories() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? values;

    await FirebaseFirestore.instance.collection("categories").get().then((value) {
      values = value.docs;
    });
    return values;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getProducts() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? values;

    await FirebaseFirestore.instance.collection("products").get().then((value) {
      values = value.docs;
    });
    return values;
  }

  Future<DocumentReference<Map<String, dynamic>>> addProduct(Map<String, dynamic> data) async {
    return await FirebaseFirestore.instance.collection("products").add(data);
  }

  Future<String> uploadImageToFireStorage(File file) async {
    Reference reference = await FirebaseStorage.instance
        .ref()
        .child("products/${file.path.split("/").last}");
    await reference.putFile(file);
    return await reference.getDownloadURL();
  }
}
