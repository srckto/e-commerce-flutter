import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/screens/home/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProductItem extends StatelessWidget {
  final ProductModel model;
  const BuildProductItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(model: model)),
      child: Container(
        width: 164,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                height: 240,
                width: double.infinity,
                child: Image.network(
                  model.image!,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              model.title!,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              model.subTitle!,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text(
              "\$" + model.price.toString(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
