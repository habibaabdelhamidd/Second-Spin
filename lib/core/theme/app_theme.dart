import 'package:flutter/material.dart';
class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0XFF7AAB99),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      primary: const Color(0xFF7AAB99),
      seedColor: const Color(0xFF7AAB99),
      onSecondary: const Color(0xFFEFEEEE),
      onBackground: Colors.white,
    ),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Color(0XFF2B3139)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
    textTheme: TextTheme(
      titleLarge:TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const Color(0xFFB7935F).withOpacity(0.7),
    ),
    dividerColor: const Color(0xFFB7935F),
  );

}
