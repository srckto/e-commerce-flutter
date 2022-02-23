import 'package:e_commerce/controllers/account/account_controller.dart';
import 'package:e_commerce/screens/account/screens/edit_profile_screen.dart';
import 'package:e_commerce/screens/account/screens/order_history_screen.dart';
import 'package:e_commerce/screens/account/screens/user_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends GetWidget<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (_) => controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.network(
                              controller.userModel!.picture,
                              width: 120,
                              height: 120,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.userModel!.name,
                                  style:
                                      Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 26),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.userModel!.email,
                                  style:
                                      Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Column(
                        children: [
                          _buildItem(
                            imagePath: 'assets/images/Icon_Edit-Profile.png',
                            onTap: () => Get.to(() => EditProfileScreen()),
                            title: 'Edit Profile',
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          SizedBox(height: 15),
                          _buildItem(
                            imagePath: 'assets/images/Icon_Location.png',
                            onTap: () {},
                            title: 'Shipping Address',
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          SizedBox(height: 15),
                          _buildItem(
                            imagePath: 'assets/images/Icon_History.png',
                            onTap: () => Get.to(() => OrderHistoryScreen()),
                            title: 'Order History',
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          SizedBox(height: 15),
                          _buildItem(
                            imagePath: 'assets/images/Icon_Payment.png',
                            onTap: () {},
                            title: 'Cards',
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          SizedBox(height: 15),
                          _buildItem(
                            imagePath: 'assets/images/Icon_Alert.png',
                            onTap: () {},
                            title: 'Notifications',
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          SizedBox(height: 15),
                          if (controller.userModel!.isPublisher)
                            _buildItem(
                              imagePath: 'assets/images/Icon_Payment.png',
                              onTap: () => Get.to(() => UserProductScreen()),
                              title: 'Your products',
                              icon: Icons.arrow_forward_ios_sharp,
                            ),
                          SizedBox(height: 15),
                          _buildItem(
                            imagePath: 'assets/images/Icon_Exit.png',
                            onTap: () {
                              controller.singOut();
                            },
                            title: 'Log Out',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class _buildItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function() onTap;
  final IconData? icon;
  const _buildItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(imagePath),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
            ),
          ),
          if (icon != null) Icon(icon, size: 20),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
