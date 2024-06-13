import 'package:flutter/material.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/sell/form/charity_form.dart';
import 'package:graduation/screens/sell/form/sell_form.dart';

class SellView extends StatelessWidget {
  static const String routeName = "SellView";

  const SellView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Selling options",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: mediaquery.width * 0.05,
                bottom: mediaquery.width * 0.08,
                right: mediaquery.width * 0.04,
                left: mediaquery.width * 0.04),
            margin: EdgeInsets.only(
                top: mediaquery.width * 0.1,
                bottom: mediaquery.width * 0.1,
                right: mediaquery.width * 0.06,
                left: mediaquery.width * 0.06),
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
                    Image.asset("assets/image/options.png")
                  ],
                ),
                const Text(
                  "Category \nUsed product",
                  style: TextStyle(color: Color(0XFFc5c5c5), fontSize: 15),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SellForm.routeName);
                    },
                    child: Container(
                      width: mediaquery.width * 0.9,
                      margin: EdgeInsets.only(top: mediaquery.width * 0.04),
                      padding: EdgeInsets.all(mediaquery.width * 0.04),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: theme.colorScheme.primary),
                      child: Text("Sell",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70)),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: mediaquery.height / 10,
          ),
          Container(
            padding: EdgeInsets.only(
                top: mediaquery.width * 0.05,
                bottom: mediaquery.width * 0.08,
                right: mediaquery.width * 0.04,
                left: mediaquery.width * 0.04),
            margin: EdgeInsets.only(
                top: mediaquery.width * 0.1,
                bottom: mediaquery.width * 0.1,
                right: mediaquery.width * 0.06,
                left: mediaquery.width * 0.06),
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
                    Image.asset("assets/image/options.png")
                  ],
                ),
                const Text(
                  "Category \nProduct with less price for recycle",
                  style: TextStyle(color: Color(0XFFc5c5c5), fontSize: 15),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CharityForm.routeName);
                    },
                    child: Container(
                      width: mediaquery.width * 0.9,
                      margin: EdgeInsets.only(top: mediaquery.width * 0.04),
                      padding: EdgeInsets.all(mediaquery.width * 0.04),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: theme.colorScheme.primary),
                      child: Text("Donate",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70)),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
