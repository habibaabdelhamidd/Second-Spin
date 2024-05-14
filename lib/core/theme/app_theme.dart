import 'package:flutter/material.dart';
class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0XFF7AAB99),
    scaffoldBackgroundColor: const Color(0xffF7F7F7),
    colorScheme: ColorScheme.fromSeed(
      primary: const Color(0xFF7AAB99),
      seedColor: const Color(0xFF7AAB99),
      onSecondary: const Color(0xFFEFEEEE),
      secondary: const Color(0xff2B3139),
    ),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Color(0XFF2B3139)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          fontFamily: 'poppins'
        )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xffEFEEEE),
      selectedIconTheme: IconThemeData(
        color: Color(0xff7AAB99),
        size: 32,
      ),
      selectedItemColor: Color(0xff7AAB99),
      unselectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 28,
      ),
      unselectedItemColor: Colors.black,
    ),
    textTheme: const TextTheme(
      titleLarge:TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w900,
        color: Color(0xff2B3139),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Color(0xff2B3139),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff2B3139),
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        color: Color(0xff7a7a7a),
      ),
      labelSmall: TextStyle(
        fontFamily: "poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xff7A7A7A),
      ),
      labelMedium: TextStyle(
        fontFamily: "poppins",
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xf72B3139),
      ),
      labelLarge:  TextStyle(
        fontFamily: "poppins",
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
  ));

}
