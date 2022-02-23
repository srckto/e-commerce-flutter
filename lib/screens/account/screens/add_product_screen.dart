import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/account/add_product_controller.dart';
import 'package:e_commerce/screens/widgets/custom_button.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';
import 'package:e_commerce/screens/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
        init: AddProductController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: CustomText(
                text: "Add Product",
              ),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      CustomTextFormField(
                        title: "Title",
                        hint: "Enter title",
                        onChanged: (value) {
                          controller.title = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Form is empty!";
                          if (value.length < 4) return "Title is too short";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextFormField(
                        title: "SubTitle",
                        hint: "Enter SubTitle",
                        onChanged: (value) {
                          controller.subTitle = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Form is empty!";
                          if (value.length < 4) return "SubTitle is too short";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextFormField(
                        title: "Description",
                        hint: "Enter description",
                        maxLines: 4,
                        onChanged: (value) {
                          controller.description = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Form is empty!";
                          if (value.length < 15) return "Description is too short";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextFormField(
                        title: "Price",
                        hint: "Enter price",
                        onChanged: (value) {
                          controller.price = value;
                        },
                        textInputType: TextInputType.number,
                        validator: (value) {
                          int? valueParse = int.tryParse(value!);
                          if (valueParse == null) return "Form is empty!";
                          if (value.isEmpty) return "Form is empty!";
                          if (valueParse <= 0) return "Invalid value";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextFormField(
                        title: "Size",
                        hint: "Enter size",
                        onChanged: (value) {
                          controller.sized = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Form is empty!";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Select Category"),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: k_primary,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 7,
                                  offset: Offset(1, 3),
                                ),
                              ],
                            ),
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(10),
                              value: controller.category,
                              underline: Container(),
                              items: controller.categoryItems
                                  .map(
                                    (element) => DropdownMenuItem<String>(
                                      child: CustomText(
                                        text: element,
                                        fontSize: 17,
                                      ),
                                      value: element,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                controller.onChangeCategoryDropButton(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Select Color"),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      hexInputBar: true,
                                      pickerAreaHeightPercent: 0.6,
                                      pickerColor: controller.color,
                                      onColorChanged: (changeColor) {
                                        controller.onColorChanged(changeColor);
                                        // controller.color = changeColor;
                                        // print(changeColor);
                                      },
                                    ),
                                  ),
                                  actions: <Widget>[
                                    CustomButton(
                                      title: "Close",
                                      onPress: () => Get.back(),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              width: 50,
                              height: 35,
                              decoration: BoxDecoration(
                                color: controller.color,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        // width: Get.width * 0.8,
                        height: 180,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: controller.imageFile == null
                            ? Image.asset("assets/images/no_image.jpg", fit: BoxFit.cover)
                            : Image.file(controller.imageFile!),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: Get.width * 0.4,
                        child: CustomButton(
                          radius: 10,
                          title: controller.imageFile == null ? "Select Image" : "Change Image",
                          onPress: () {
                            controller.pickImage();
                          },
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(bottom: 25),
              child: CustomButton(
                radius: 0,
                title: "Add Product",
                onPress: controller.isLoading
                    ? null
                    : () {
                        controller.addProduct();
                      },
              ),
            ),
          );
        });
  }
}
