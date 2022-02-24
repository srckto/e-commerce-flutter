import 'package:e_commerce/screens/home/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/controllers/home/home_controller.dart';

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
                            return Column(
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
                                  style:
                                      Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13),
                                ),
                              ],
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
                        height: 300,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.productsModels.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 20);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => Get.to(() =>
                                  ProductDetailsScreen(model: controller.productsModels[index])),
                              child: Container(
                                width: 164,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        height: 240,
                                        width: 164,
                                        child: Image.network(
                                          controller.productsModels[index].image!,
                                          height: 240,
                                          width: 164,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller.productsModels[index].title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 18),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      controller.productsModels[index].subTitle!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "\$554",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            );
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
