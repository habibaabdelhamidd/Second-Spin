import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recycl_Product_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquare = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/image/laptop.jpeg",
            width: mediaquare.width / 2.2,
            fit:BoxFit.fill,
          ),
          Text(
            "Apple MacBook Pro 13",
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            "EG 60,000",
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            "Madinaty, Egypt",
            style: theme.textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("assets/image/Icon fav.png"),
            ],
          ),
        ],
      ),
    );
  }
}
