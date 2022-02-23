import 'package:e_commerce/constant.dart';
import 'package:e_commerce/helper/binding.dart';
import 'package:e_commerce/helper/cart_database_helper.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await CartDatabaseHelper.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: 'Flutter Demo',
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        canvasColor: Colors.white,
        fontFamily: "SourceSans",
        primaryColor: k_primary,
        primarySwatch: k_primaryBlack,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18,
            color: k_primary,
          ),
          bodyText2: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          button: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 14,
            color: k_fontGrey,
          ),
        ),
      ),
      // home: FirebaseAuth.instance.currentUser == null ? LogInScreen() : LayoutScreen(),
      home: SplashScreen(),
    );
  }
}
