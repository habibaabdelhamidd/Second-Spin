import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import '../../login/buttons.dart';
import '../../login/text_ff.dart';

class EditAccount extends StatefulWidget {
  static const String routeName = "EditAccount";
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController nameControl = TextEditingController();

  TextEditingController emailControl = TextEditingController();

  TextEditingController numberControl = TextEditingController();

  TextEditingController passControl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
          iconTheme: theme.appBarTheme.iconTheme,
          title: Text(
            "Edit profile",
            style: theme.appBarTheme.titleTextStyle,
          )),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            child: Image(image: AssetImage("assets/image/profile.png")),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Text(
                            "Change profile picture",
                            style: theme.textTheme.bodyLarge!.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: theme.textTheme.labelLarge
                                ?.copyWith(color: const Color(0xf72B3139)),
                          ),
                          TextF(
                            hint: "Cody Fisher",
                            astrik: false,
                            textEditingController: nameControl,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            "Email",
                            style: theme.textTheme.labelLarge
                                ?.copyWith(color: const Color(0xf72B3139)),
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
                            onSaved: (mail) {
                              mail = emailControl.text;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            "Phone Number",
                            style: theme.textTheme.labelLarge
                                ?.copyWith(color: const Color(0xf72B3139)),
                          ),
                          TextF(
                              hint: "(209) 555-0104",
                              astrik: false,
                              textEditingController: numberControl,
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter phone number";
                                }
                                if (value.length < 11) {
                                  return "Invalid phone number";
                                }
                  
                                return null;
                              },
                              onSaved: (String? pass) {
                                pass = passControl.text;
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            "Password",
                            style: theme.textTheme.labelLarge
                                ?.copyWith(color: const Color(0xf72B3139)),
                          ),
                          TextF(
                              hint: "*******",
                              astrik: false,
                              textEditingController: passControl,
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter password";
                                }
                                var regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                                if (!regex.hasMatch(value)) {
                                  return "Invalid Password";
                                }
                                return null;
                              },
                              onSaved: (String? pass) {
                                pass = passControl.text;
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      MaterialButton(
                          onPressed: () {
                            validate();
                            Api_Manager.editProfile( emailControl.text.toString(),
                                passControl.text.toString(),
                                nameControl.text.toString());
                          },
                          child: Buttons(title: "Save changes", padd: 18))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  validate() {
    if (formKey.currentState!.validate()) {
      // Navigator.pushNamed(context, HomeLayout.routeName);
    }
  }
}
