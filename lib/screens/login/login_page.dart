import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/shared_preference.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
import 'package:http/http.dart' as http;
import '../../layouts/homelayout/homelayout.dart';
import '../../models/loginResponse/LoginResponse.dart';
import '../register/register_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  Future<LoginResponse> login(String email, String password) async {
    String? token = await Preference.getToken();
    var response = await http.post(
        Uri.parse("http://secondspin.xyz/api/auth/login"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(
            <String, dynamic>{"password": password, "email": email}));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(response.body);
      var loginResponse = LoginResponse.fromJson(result);
      Preference.saveToken(loginResponse.data?.token);
      Navigator.pushNamed(context, HomeLayout.routeName);
    }
    else if(response.statusCode == 401){
      return Future.error("Invalid credentials");
    }
    final result = jsonDecode(response.body);
    print(response.body);
    var loginResponse = LoginResponse.fromJson(result);
    return loginResponse;
  }

  var formKey = GlobalKey<FormState>();
  bool isVisible = false;
  // Map <String,String> authdata= {"email":'',"password":''};

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/auth_bg.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Text(
                    "Welcome back!",
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    "Login to your account",
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 17),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text("Email", style: theme.textTheme.labelMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextF(
                    hint: "alma.lawson@example.com",
                    asterisk: false,
                    textEditingController: emailControl,
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your E-mail address";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid E-mail address";
                      }
                      // if(value != emailControl.toString()){
                      //   return "User not found";
                      // }
                      return null;
                    },
                    // onSaved:(String? mail){
                    //   emailControl.text = mail!;
                    // },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text("Password", style: theme.textTheme.labelMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextF(
                      hint: "*************",
                      asterisk: !isVisible,
                      icon: IconButton(
                          onPressed: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          icon: isVisible == true
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      textEditingController: passControl,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter password";
                        }
                        // if(value != passControl.toString()){
                        //   return "Wrong password";
                        // }
                        return null;
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text(
                          "Forget Password?",
                          style: theme.textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  MaterialButton(
                      onPressed: () {
                        loginValidation();
                        login(emailControl.text, passControl.text);
                      },
                      child: Buttons(
                        title: 'Login',
                        padd: 15,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",
                          style: theme.textTheme.labelSmall),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterPage.routeName);
                          },
                          child: const Text("Sign Up",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.lightBlueAccent)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  loginValidation() {
    if (formKey.currentState!.validate()) {
      // Navigator.pushNamed(context, HomeLayout.routeName);
    }
    // formKey.currentState?.save();
  }
}
