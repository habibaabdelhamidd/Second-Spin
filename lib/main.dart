import 'package:flutter/material.dart';
import 'package:graduation/core/theme/app_theme.dart';
import 'package:graduation/layouts/homelayout/homelayout.dart';
import 'package:graduation/screens/boarding/boarding1.dart';
import 'package:graduation/screens/boarding/boarding2.dart';
import 'package:graduation/screens/boarding/onboarding3.dart';
import 'package:graduation/screens/cart/cart_checkout/cart_checkout.dart';
import 'package:graduation/screens/category/recycle/recycle_product_details/recycle_products_details.dart';
import 'package:graduation/screens/category/recycle/recycle_products/recycle_products.dart';
import 'package:graduation/screens/category/used/used_category.dart';
import 'package:graduation/screens/category/used/used_details.dart';
import 'package:graduation/screens/category/used/used_items.dart';
import 'package:graduation/screens/category/used/used_view.dart';
import 'package:graduation/screens/home/favourite/all_favourit_product.dart';
import 'package:graduation/screens/home/home/home.dart';
import 'package:graduation/screens/home/search/search_details.dart';
import 'package:graduation/screens/home/search/search_items.dart';
import 'package:graduation/screens/home/search/search_view.dart';
import 'package:graduation/screens/login/login_page.dart';
import 'package:graduation/screens/register/register_page.dart';
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
        HomeScreen.routeName: (context)=> const HomeScreen(),
        RecycleViewProducts.routeName : (context)=> RecycleViewProducts(),
        LoginPage.routeName : (context)=> LoginPage(),
        RegisterPage.routeName  : (context)=> RegisterPage(),
        All_Favourit_Product.routeName: (context)=> All_Favourit_Product(),
        Recycle_Product_Details.routeName : (context)=> Recycle_Product_Details(),
        SearchView.routeName : (context)=> const SearchView(),
        Cart_Chackout.routeName : (context)=> Cart_Chackout(),
        SearchItem.routeName : (context)=> const SearchItem(),
        SearchDetails.routeName : (context)=> const SearchDetails(),
        UsedView.routeName : (context)=> UsedView(),
        UsedCategory.routeName : (context)=> UsedCategory(),
        UsedItem.routeName : (context)=> UsedItem(),
        UsedDetails.routeName : (context)=> UsedDetails()
      },
      home: Splashscreen(),
    );
  }
}


