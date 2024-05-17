import 'package:flutter/material.dart';
import '../../login/buttons.dart';
import '../../login/text_ff.dart';

class EditAccount extends StatelessWidget {
  static const String routeName = "EditAccount";
  const EditAccount({super.key});

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
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
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
                  style: theme.textTheme.labelLarge?.copyWith(color: Color(0xf72B3139)),
                ),
                TextF(hint: "Cody Fisher", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Email",
                  style: theme.textTheme.labelLarge?.copyWith(color: Color(0xf72B3139)),
                ),
                TextF(hint: "alma.lawson@example.com", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Phone Number",
                  style: theme.textTheme.labelLarge?.copyWith(color: Color(0xf72B3139)),
                ),
                TextF(hint: "(209) 555-0104", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Password",
                  style: theme.textTheme.labelLarge?.copyWith(color: Color(0xf72B3139)),
                ),
                TextF(hint: "*******", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Buttons(title: "Save changes", padd: 18)
          ],
        ),
      ),
    );
  }
}
