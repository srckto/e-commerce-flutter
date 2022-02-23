import 'package:flutter/material.dart';

import 'package:e_commerce/constant.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPress;
  final String title;
  final double elevation;
  final double radius;
  final Color color;
  const CustomButton({
    Key? key,
    this.onPress,
    required this.title,
    this.elevation = 2,
    this.radius = 4,
    this.color = k_primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          primary: color,
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.button!.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
