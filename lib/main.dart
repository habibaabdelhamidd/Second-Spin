import 'package:flutter/material.dart';
import 'package:graduation/screens/boarding/boarding1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Onboarding1.routeName,
      routes: {
        Onboarding1.routeName : (context)=> Onboarding1() ,
      }

    );
  }
}


