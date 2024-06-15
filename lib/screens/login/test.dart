// import 'package:flutter/material.dart';
// import 'package:graduation/layouts/homelayout/homelayout.dart';
// import 'package:graduation/screens/login/login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Test extends StatefulWidget {
//   const Test({super.key});
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   bool initial = true;
//   String? token;
//   @override
//   Widget build(BuildContext context) {
//     if (initial) {
//       SharedPreferences.getInstance().then((value) {
//         setState(() {
//           initial = false;
//           token = value.getString("token");
//         });
//       });
//       return const CircularProgressIndicator();
//     } else{
//       if(token == null){
//         return const LoginPage();
//       } else {
//         return HomeLayout();
//       }
//   }
//   }
//   }

