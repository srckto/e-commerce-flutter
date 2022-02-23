import 'package:e_commerce/screens/home/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/account/user_products_controller.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/screens/account/screens/add_product_screen.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductsController>(
      init: UserProductsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: CustomText(
              text: "Your Products",
            ),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Get.to(() => AddProductScreen()),
                child: CustomText(
                  text: "Add Product",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: k_primary,
                ),
              ),
            ],
          ),
          body: controller.isLoading
              ? Center(child: CircularProgressIndicator.adaptive())
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    itemCount: controller.products.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(model: controller.products[index]);
                    },
                  ),
                ),
        );
      },
    );
  }
}

class _buildItem extends StatelessWidget {
  final ProductModel model;
  const _buildItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(model: model)),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 7,
              // offset: Offset(1, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: model.title!,
                          fontWeight: FontWeight.bold,
                          maxLine: 1,
                        ),
                        CustomText(
                          text: model.subTitle!,
                          maxLine: 2,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    // SizedBox(height: 10),
                    CustomText(
                      text: "\$" + model.price!.toString(),
                      color: k_primary,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 105,
              height: 105,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image.network(model.image!, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
