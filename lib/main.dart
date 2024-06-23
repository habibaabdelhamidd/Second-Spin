import 'package:flutter/material.dart';
import 'package:graduation/core/shared_preference.dart';
import 'package:graduation/core/theme/app_theme.dart';
import 'package:graduation/layouts/homelayout/homelayout.dart';
import 'package:graduation/screens/account/edit_account/edit_account.dart';
import 'package:graduation/screens/account/settings_account/settings_account.dart';
import 'package:graduation/screens/boarding/boarding1.dart';
import 'package:graduation/screens/boarding/boarding2.dart';
import 'package:graduation/screens/boarding/onboarding3.dart';
import 'package:graduation/screens/cart/cart_checkout/cart_checkout.dart';
import 'package:graduation/screens/cart/cart_view/cart_user_data.dart';
import 'package:graduation/screens/category/recycle/recycle_product_details/recycle_products_details.dart';
import 'package:graduation/screens/category/recycle/recycle_products/recycle_products.dart';
import 'package:graduation/screens/category/used/used_category.dart';
import 'package:graduation/screens/category/used/used_details.dart';
import 'package:graduation/screens/category/used/used_view.dart';
import 'package:graduation/screens/home/favourite/all_favourite_product.dart';
import 'package:graduation/screens/home/favourite/favourite_product_details.dart';
import 'package:graduation/screens/home/home/home.dart';
import 'package:graduation/screens/home/search/search_details.dart';
import 'package:graduation/screens/login/login_page.dart';
import 'package:graduation/screens/register/register_page.dart';
import 'package:graduation/screens/sell/form/charity_form.dart';
import 'package:graduation/screens/sell/form/sell_form.dart';
import 'package:graduation/screens/sell/sell_view.dart';
import 'package:graduation/screens/splash/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Preference. prefs =  await SharedPreferences.getInstance();
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
        HomeScreen.routeName: (context)=>  HomeScreen(),
        RecycleViewProducts.routeName : (context)=> RecycleViewProducts(),
        LoginPage.routeName : (context)=> const LoginPage(),
        RegisterPage.routeName  : (context)=> const RegisterPage(),
        All_Favourit_Product.routeName: (context)=> All_Favourit_Product(),
        Favourite_product_details.routeName: (context)=> Favourite_product_details(),
        Recycle_Product_Details.routeName : (context)=> Recycle_Product_Details(),
        Cart_Chackout.routeName : (context)=> Cart_Chackout(),
        SearchDetails.routeName : (context)=> const SearchDetails(),
        UsedView.routeName : (context)=> const UsedView(),
        UsedCategory.routeName : (context)=> const UsedCategory(),
        UsedDetails.routeName : (context)=> const UsedDetails(),
        SellView.routeName : (context)=> const SellView(),
        SellForm.routeName : (context)=> const SellForm(),
        CharityForm.routeName : (context)=> const CharityForm(),
        EditAccount.routeName : (context)=> const EditAccount(),
        Settings_Account.routeName: (context)=> Settings_Account(),
        CartUserData.routeName: (context)=> CartUserData(),

      },
      home: Splashscreen()

      ,
    );
  }
}


