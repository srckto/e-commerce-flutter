import 'package:e_commerce/constant.dart';
import 'package:e_commerce/screens/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/controllers/account/order_history_controller.dart';
import 'package:e_commerce/models/order_model.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(
        init: OrderHistoryController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: CustomText(
                text: "Order History",
              ),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Builder(
                builder: (context) {
                  if (controller.isLoading) return Center(child: CircularProgressIndicator());
                  if (controller.orders.isEmpty) return EmptyScreen(message: "Empty");
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    clipBehavior: Clip.none,
                    itemCount: controller.orders.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 40);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(orderModel: controller.orders[index]);
                    },
                  );
                },
              ),
            ),
          );
        });
  }
}

class _buildItem extends StatelessWidget {
  final OrderModel orderModel;
  _buildItem({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.parse(orderModel.dateTime!);
    String _dateConvert = DateFormat.yMMMd().format(_dateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: _dateConvert),
        SizedBox(height: 15),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: orderModel.Carts!.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 15);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              clipBehavior: Clip.none,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: orderModel.Carts![index].title!,
                            fontWeight: FontWeight.bold,
                            maxLine: 1,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomText(
                                text: "\$" + orderModel.Carts![index].price!.toString(),
                                color: k_primary,
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                text: "x" + orderModel.Carts![index].quantity!.toString(),
                                color: k_fontGrey,
                                fontSize: 12,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CustomText(
                                text: "Total :",
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                text: "\$" +
                                    "${orderModel.Carts![index].price! * orderModel.Carts![index].quantity!}",
                                color: k_primary,
                              ),
                            ],
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
                    child: Image.network(orderModel.Carts![index].image!, fit: BoxFit.cover),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
