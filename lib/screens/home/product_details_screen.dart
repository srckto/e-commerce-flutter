import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/controllers/cart/cart_controller.dart';
import 'package:e_commerce/controllers/home/home_controller.dart';
import 'package:e_commerce/helper/hex_color.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/screens/widgets/custom_button.dart';

class ProductDetailsScreen extends GetWidget<HomeController> {
  final ProductModel model;
  ProductDetailsScreen({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Stack(
                  children: [
                    Image.network(
                      model.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Color(0xFFEBEBEB),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Size",
                                  style:
                                      Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
                                ),
                                Text(
                                  model.sized ?? "None",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Color(0xFFEBEBEB),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Colour",
                                  style:
                                      Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(model.color!),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Details",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      model.description!,
                      style:
                          Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15, height: 2),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15),
                    ),
                    Text(
                      "\$" + model.price.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                // addProductToCart
                flex: 3,
                child: GetBuilder<CartController>(
                  init: CartController(),
                  builder: (innerController) => CustomButton(
                    title: "ADD",
                    onPress: () {
                      innerController.addProduct(
                        CartModel(
                          id: model.id,
                          image: model.image,
                          title: model.title,
                          price: model.price,
                          quantity: 1,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
