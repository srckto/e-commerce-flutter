import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/cart/cart_controller.dart';
import 'package:e_commerce/controllers/check_out/check_out_controller.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            GetBuilder<CartController>(
              builder: (controller) => Container(
                height: 195,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  clipBehavior: Clip.none,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.allCarts.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              controller.allCarts[index].image!,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            controller.allCarts[index].title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                "\$" + controller.allCarts[index].price!.toString(),
                                style: TextStyle(color: k_primary),
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                text: "x" + controller.allCarts[index].quantity!.toString(),
                                color: k_fontGrey,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Shipping Address",
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: GetBuilder<CheckOutController>(
                          builder: (controller) => CustomText(
                            text: controller.address!,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/images/Radio_Button.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  GetBuilder<CheckOutController>(
                    builder: (controller) => GestureDetector(
                      onTap: () {
                        controller.index = 0;
                        controller.nextScreen();
                      },
                      child: CustomText(
                        text: "Change",
                        color: k_primary,
                      ),
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
