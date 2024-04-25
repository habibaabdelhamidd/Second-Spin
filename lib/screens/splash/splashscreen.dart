import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../boarding/boarding1.dart';
class Splashscreen extends StatelessWidget {
  static const String routeName = "splashscreen";

  @override
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery
        .of(context)
        .size;
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Onboarding1.routeName);
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset("assets/image/splash.png",
            width: mediaquary.width, height: mediaquary.height,
            fit: BoxFit.fill,),
          Center(child: Image.asset
            ("assets/image/SecondSpinlogo splash.png")),
        ],
      ),
    );
  }
}