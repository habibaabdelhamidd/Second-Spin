import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/account/account.dart';
import 'package:graduation/screens/cart/cart.dart';
import 'package:graduation/screens/category/category.dart';
import 'package:graduation/screens/home/home.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homelayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedNavgatorIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: theme.appBarTheme.elevation,
        iconTheme: IconThemeData(color: theme.appBarTheme.iconTheme?.color,
        size: 25
        ),
      ),
      body: screens[selectedNavgatorIndex],
      floatingActionButton: Container(
        margin: EdgeInsets.all(30),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.transparent,
          child: FloatingActionButton(
            backgroundColor: theme.primaryColor,
            onPressed: () {},
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        selectedIconTheme: IconThemeData(
            color: theme.bottomNavigationBarTheme.selectedIconTheme?.color,
            size: theme.bottomNavigationBarTheme.selectedIconTheme?.size),
        unselectedIconTheme: IconThemeData(
            color: theme.bottomNavigationBarTheme.unselectedIconTheme?.color,
            size: theme.bottomNavigationBarTheme.unselectedIconTheme?.size),
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        onTap: (int index) {
          setState(() {
            selectedNavgatorIndex = index;
          });
        },
        currentIndex: selectedNavgatorIndex,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/iconhome.png")),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/gategoryhome.png")),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/homecart.png")),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/home account.png")),
            label: "Account",
          )
        ],
      ),
    );
  }
}
