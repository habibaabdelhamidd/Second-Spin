import 'package:flutter/material.dart';
import 'package:graduation/screens/login/buttons.dart';

class SellView extends StatelessWidget {
  static const String routeName = "SellView";
  const SellView({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            margin: const EdgeInsets.only(top: 50, bottom: 20, right: 30, left: 30),
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
                    // Navigator.pushNamed(context, UsedView.routeName);
                  },
                  child: Buttons(title: "Sell", padd: 10,)
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
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
                    // Navigator.pushNamed(context, RecycleViewProducts.routeName);
                  },
                  child: Buttons(title: "Donate", padd: 10,)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
