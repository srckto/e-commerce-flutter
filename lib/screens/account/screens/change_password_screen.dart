import 'package:e_commerce/controllers/account/edit_profile_controller.dart';
import 'package:e_commerce/screens/widgets/custom_button.dart';
import 'package:e_commerce/screens/widgets/custom_text.dart';
import 'package:e_commerce/screens/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomText(
            text: "Change Password",
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
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.passwordFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CustomTextFormField(
                    title: "Old Password",
                    hint: "Enter Old Passwrod",
                    obscureText: true,
                    onChanged: (value) {
                      controller.oldPassword = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Form is empty!";
                      if (value.length < 6) return "Password is too short";
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    title: "New Password",
                    hint: "Enter a New Passwrod",
                    obscureText: true,
                    onChanged: (value) {
                      controller.newPassword = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Form is empty!";
                      if (value.length < 6) return "Password is too short";
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    title: "Re-enter Password",
                    hint: "Re-enter a new Passwrod",
                    obscureText: true,
                    onChanged: (value) {
                      controller.reEnterNewPassword = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Form is empty!";
                      if (value.length < 6) return "Password is too short";
                      if (value != controller.newPassword) return "A new password doesn't match";
                      return null;
                    },
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
              controller.changePassword();
            },
          ),
        ),
      );
    });
  }
}
