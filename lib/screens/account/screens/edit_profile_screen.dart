import 'package:e_commerce/constant.dart';
import 'package:e_commerce/controllers/account/edit_profile_controller.dart';
import 'package:e_commerce/screens/account/screens/change_password_screen.dart';
import 'package:e_commerce/screens/widgets/custom_button.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';
import 'package:e_commerce/screens/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: CustomText(
                text: "Edit Profile",
              ),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            body: controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width,
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    clipBehavior: Clip.none,
                                    child: ClipOval(
                                      child: controller.imageFile != null
                                          ? Image.file(
                                              controller.imageFile!,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              controller.userModel!.picture,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.pickImage();
                                    },
                                    icon: CircleAvatar(
                                      child: Icon(Icons.edit, color: k_primary),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            CustomText(
                              text: controller.userModel!.name,
                              fontSize: 22,
                            ),
                            SizedBox(height: 30),
                            CustomTextFormField(
                              title: "Your Name",
                              hint: "",
                              validator: (value) {
                                if (value == null || value.isEmpty) return "Please enter your name";
                                return null;
                              },
                              onChanged: (value) {
                                controller.name = value;
                              },
                              initialValue: controller.userModel!.name,
                            ),
                            SizedBox(height: 30),
                            CustomTextFormField(
                              title: "Your phone number",
                              hint: "",
                              validator: (value) {
                                int? valueParse = int.tryParse(value!);
                                if (valueParse == null) return "Please enter a valid phone number";
                                if (value.isEmpty) return "Please enter phone number";
                                if (value.length < 6) return "Please enter a valid phone number";
                                return null;
                              },
                              onChanged: (value) {
                                controller.phoneNumber = value;
                              },
                              initialValue: controller.userModel!.phone.toString(),
                            ),
                            SizedBox(height: 30),
                            Container(
                              width: Get.width * 0.4,
                              child: CustomButton(
                                elevation: 0.0,
                                color: Colors.redAccent,
                                radius: 8,
                                title: "Change password",
                                onPress: () => Get.to(() => ChangePasswordScreen()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(bottom: 25),
              child: CustomButton(
                radius: 0,
                title: "Save",
                onPress: () {
                  controller.updateData();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
