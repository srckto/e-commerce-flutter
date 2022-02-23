import 'package:e_commerce/controllers/cart/cart_controller.dart';
import 'package:e_commerce/screens/cart/widgets/build_cart_item.dart';
import 'package:e_commerce/screens/check_out/check_out_screen.dart';
import 'package:e_commerce/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (_) => controller.allCarts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/empty_cart_co35.svg",
                    width: Get.width * 0.8,
                  ),
                  SizedBox(height: 15),
                  Text("Cart is empty"),
                ],
              ),
            )
          : Container(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.allCarts.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 15);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return BuildCartItem(model: controller.allCarts[index]);
                        },
                      ),
                    ),
                  ),
                  Container(
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
                                "Total price",
                                style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15),
                              ),
                              Text(
                                "\$" + controller.totalPrice.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomButton(
                            title: "CHECKOUT",
                            onPress: () {
                              Get.to(() => CheckOutScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
