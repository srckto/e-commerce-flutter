import 'package:e_commerce/controllers/auth/login_controller.dart';
import 'package:e_commerce/screens/auth/register_screen.dart';
import 'package:e_commerce/screens/widgets/custom_button.dart';
import 'package:e_commerce/screens/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreen extends GetWidget<LoginController> {
  LogInScreen({Key? key}) : super(key: key);

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome,",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                  ),
                                  Text(
                                    "Sign in to Continue",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Get.off(() => RegisterScreen()),
                                child: Text(
                                  "Sign Up",
                                  style:
                                      Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          CustomTextFormField(
                            onSaved: (value) {
                              controller.email = value!;
                            },
                            title: "Email",
                            hint: "Enter your email",
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                          CustomTextFormField(
                            title: "Password",
                            hint: "Enter your password",
                            obscureText: true,
                            onSaved: (value) {
                              controller.password = value!;
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              } else if (value.length < 6) {
                                return "Password is too short";
                              }
                              return null;
                            },
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style:
                                    Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15),
                              ),
                            ),
                          ),
                          GetBuilder<LoginController>(
                            builder: (_) => CustomButton(
                              title: "SIGN IN",
                              onPress: controller.isLoading
                                  ? null
                                  : () {
                                      if (_formState.currentState!.validate()) {
                                        _formState.currentState!.save();
                                        controller.signInWithEmail();
                                      }
                                    },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text("-OR-"),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        controller.signInWithFacebook();
                        print("Facebook");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFDDDDDD)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/facebook.png"),
                            Expanded(
                              child: Center(child: Text("Sign In with Facebook")),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        print("Google");
                        controller.signInWithGoogle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFDDDDDD)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/google.png"),
                            Expanded(
                              child: Center(child: Text("Sign In with Google")),
                            ),
                          ],
                        ),
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
