import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';

import '../../layouts/homelayout/homelayout.dart';
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

  var formKey = GlobalKey<FormState>();
  bool isVisible = false;

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
                    astrik: false,
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
                      return null;
                    },
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
                      astrik: !isVisible,
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
                        return null;
                      }
                      ),
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
                        // login();
                        Navigator.pushNamed(context, HomeLayout.routeName);
                        // String email = emailControl.text;
                        // String password = passControl.text;
                        // Api_Manager.login(email, password);
                        // print(email + " " + password);
                      },
                      child: Buttons(
                        title: 'Login', padd: 15,
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

//   login() {
//     if (formKey.currentState!.validate()) {
//       Navigator.pushNamed(context, HomeLayout.routeName);
//     }
//   }
 }
