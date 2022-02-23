import 'package:e_commerce/controllers/cart/cart_controller.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/models/cart_model.dart';
import 'package:get/get.dart';

class BuildCartItem extends StatelessWidget {
  final CartModel model;
  BuildCartItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: 120,
            height: 120,
            child: Image.network(
              model.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title!,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                "\$" + model.price!.toString(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
              ),
              SizedBox(height: 10),
              Container(
                width: 95,
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xFF000000).withOpacity(0.06),
                ),
                child: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.increaseQuantity(model);
                            },
                            child: Icon(Icons.add),
                          ),
                          Text(model.quantity!.toString()),
                          InkWell(
                            onTap: () {
                              controller.decreaseQuantity(model);
                            },
                            child: Icon(Icons.remove),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
