import 'dart:io';

import 'package:antique_homes_getx/modules/login/screens/homepages/home_screen.dart';
import 'package:antique_homes_getx/modules/login/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'common/app_preference.dart';
import 'common/indicator.dart';
import 'modules/login/screens/homepages/cart_screen.dart';
import 'modules/login/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppPreference.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Loading(
      child: GetMaterialApp(
          // scrollBehavior: MyCustomScrollBehavior(),

          getPages: [
            GetPage(name: "/home", page: () => HomeScreen()),
            GetPage(name: "/cart", page: () => CartScreen()),
            GetPage(name: "/login", page: () => LoginScreen()),
            GetPage(name: "/register", page: () => RegisterScreen()),
          ],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen()),
    );
  }
}
