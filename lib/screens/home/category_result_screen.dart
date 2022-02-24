import 'package:e_commerce/screens/widgets/build_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/controllers/home/home_controller.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';
import 'package:e_commerce/screens/widgets/empty_screen.dart';

class CategoryResultScreen extends GetWidget<HomeController> {
  final String categoryName;
  const CategoryResultScreen({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getCategoryResult(categoryName);
    print(categoryName);
    print(controller.categoryResult);
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: CustomText(
                text: categoryName,
              ),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            body: Builder(builder: (context) {
              if (controller.isLoadingCategoryProducts)
                return Center(child: CircularProgressIndicator());
              if (controller.categoryResult.isEmpty)
                return EmptyScreen(message: "Category is Empty");

              return Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  itemCount: controller.categoryResult.length,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.56,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => BuildProductItem(
                    model: controller.categoryResult[index],
                  ),
                ),
              );
            }),
          );
        });
  }
}
