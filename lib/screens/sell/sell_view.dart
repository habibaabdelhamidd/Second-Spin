import 'package:flutter/material.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/sell/form/charity_form.dart';
import 'package:graduation/screens/sell/form/sell_form.dart';

class SellView extends StatelessWidget {
  static const String routeName = "SellView";
  const SellView({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Selling options",
            style: theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: Column(children: [
          Container(
              padding: EdgeInsets.all(mediaQuery.width * 0.07),
              margin: EdgeInsets.all(mediaQuery.width * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Products",
                          style: theme.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 45,
                          color: theme.primaryColor,
                        )
                      ],
                    ),
                    const Text(
                      "Used Products",
                      style: TextStyle(color: Color(0XFFc5c5c5), fontSize: 15),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SellForm.routeName);
                        },
                        child: Buttons(
                          title: "Sell",
                          padd: 16,
                        ))
                  ])),
          Container(
            padding: EdgeInsets.all(mediaQuery.width * 0.07),
            margin: EdgeInsets.all(mediaQuery.width * 0.05),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Charity",
                      style: theme.textTheme.titleLarge,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.handshake_outlined,
                      size: 45,
                      color: theme.primaryColor,
                    )
                  ],
                ),
                const Text(
                  "Product with less price for recycle",
                  style: TextStyle(color: Color(0XFFc5c5c5), fontSize: 15),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CharityForm.routeName);
                    },
                    child: Buttons(
                      title: "Donate",
                      padd: 16,
                    )),
              ],
            ),
          ),
        ]));
  }
}
