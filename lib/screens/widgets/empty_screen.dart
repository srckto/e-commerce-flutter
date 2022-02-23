import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmptyScreen extends StatelessWidget {
  final String message;
  const EmptyScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/empty_cart_co35.svg",
            width: Get.width * 0.8,
          ),
          SizedBox(height: 15),
          Text(message),
        ],
      ),
    );
  }
}
