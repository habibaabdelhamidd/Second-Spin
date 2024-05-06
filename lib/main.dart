import 'package:flutter/material.dart';
import 'package:graduation/core/theme/app_theme.dart';
import 'package:graduation/layouts/homelayout/homelayout.dart';
import 'package:graduation/screens/boarding/boarding1.dart';
import 'package:graduation/screens/boarding/boarding2.dart';
import 'package:graduation/screens/boarding/onboarding3.dart';
import 'package:graduation/screens/category/recycle/recycle_products/recycle_products.dart';
import 'package:graduation/screens/login/login_page.dart';
import 'package:graduation/screens/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,

      initialRoute: Splashscreen.routeName,
      routes: {
        Splashscreen.routeName :(context)=> Splashscreen(),
        Onboarding1.routeName : (context)=> Onboarding1() ,
        Onboarding2.routeName: (context)=> Onboarding2(),
        Onboarding3.routeName: (context)=> Onboarding3(),
        HomeLayout.routeName : (context)=> HomeLayout(),
        RecycleViewProducts.routeName : (context)=> RecycleViewProducts(),
        LoginPage.routeName : (context)=> LoginPage()
      },
      home: Splashscreen(),
    );
  }
}


