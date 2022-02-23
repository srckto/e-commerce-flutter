import 'package:e_commerce/controllers/auth/register_controller.dart';
import 'package:e_commerce/screens/auth/login_screen.dart';
import 'package:e_commerce/screens/widgets/custom_button.dart';
import 'package:e_commerce/screens/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);
  // final TextEditingController? _nameController = TextEditingController();
  // final TextEditingController? _emailController = TextEditingController();
  // final TextEditingController? _passwordController = TextEditingController();
  // final TextEditingController? _rePasswordController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formState,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                            ),
                          ),
                          SizedBox(height: 40),
                          CustomTextFormField(
                            title: "Name",
                            hint: "Enter your name",
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              controller.name = value!;
                            },
                          ),
                          SizedBox(height: 30),
                          CustomTextFormField(
                            title: "Email",
                            hint: "Enter your email",
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              controller.email = value!;
                            },
                          ),
                          SizedBox(height: 30),
                          CustomTextFormField(
                            textInputType: TextInputType.number,
                            title: "Phone Number",
                            hint: "Enter your phone number",
                            validator: (String? value) {
                              int? parseValue = int.tryParse(value!);
                              if (parseValue == null || value.isEmpty) {
                                return "Please enter your phone number";
                              } else if (value.length < 7) return "Phone number is too short";
                              return null;
                            },
                            onSaved: (String? value) {
                              int? newValue = int.tryParse(value!);
                              controller.phoneNumber = newValue == null ? 0 : newValue;
                            },
                          ),
                          SizedBox(height: 30),
                          CustomTextFormField(
                            title: "Password",
                            hint: "Enter your password",
                            obscureText: true,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              } else if (value.length < 6) {
                                return "The password is too short";
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              controller.password = value!;
                            },
                          ),
                          SizedBox(height: 30),
                          CustomTextFormField(
                            title: "Re-Password",
                            hint: "Re-enter your password",
                            obscureText: true,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please re-enter your password";
                              } else if (controller.password != controller.rePassword) {
                                return "Password doesn't match";
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              controller.rePassword = value!;
                            },
                          ),
                          SizedBox(height: 30),
                          GetBuilder<RegisterController>(
                            builder: (_) => CustomButton(
                              title: "SIGN UP",
                              onPress: controller.isLoading
                                  ? null
                                  : () {
                                      _formState.currentState!.save();
                                      if (_formState.currentState!.validate()) {
                                        controller.registerWithEmailAndPassword();
                                      }
                                    },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already you have an account?",
                                style:
                                    Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15),
                              ),
                              TextButton(
                                onPressed: () => Get.off(() => LogInScreen()),
                                child: Text(
                                  "Sign In",
                                  style:
                                      Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
