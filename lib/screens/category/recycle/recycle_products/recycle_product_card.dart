import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recycl_Product_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquary = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(mediaquary.width * 0.015),
      margin: EdgeInsets.all(mediaquary.width * 0.01),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/image/laptop.jpeg",
            width: mediaquary.width / 2.2,
            fit: BoxFit.fill,
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
