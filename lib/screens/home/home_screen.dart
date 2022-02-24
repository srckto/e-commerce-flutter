import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/controllers/home/home_controller.dart';
import 'package:e_commerce/screens/home/category_result_screen.dart';
import 'package:e_commerce/screens/widgets/build_product_item.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: controller.getProductItems,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300,
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Categories",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          itemCount: controller.categoryModels.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 20);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => Get.to(
                                () => CategoryResultScreen(
                                  categoryName: controller.categoryModels[index].name!,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15,
                                          color: Colors.grey.shade300,
                                          offset: Offset(0, 7),
                                        ),
                                      ],
                                    ),
                                    child: Image.network(
                                      controller.categoryModels[index].image!,
                                      scale: 0.9,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    controller.categoryModels[index].name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 13),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Selling",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                          ),
                          TextButton(
                            child: Text(
                              "See All",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 310,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.productsModels.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 20);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return BuildProductItem(model: controller.productsModels[index]);
                          },
                        ),
                      ),

                      // GridView.builder(
                      //   itemCount: 6,
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //   ),
                      //   itemBuilder: (context, index) => Text("data"),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
