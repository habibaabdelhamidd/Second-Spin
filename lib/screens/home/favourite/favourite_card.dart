import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourite_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(mediaquary.width * 0.015),
      margin: EdgeInsets.all(mediaquary.width * 0.01),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/image/favimage.png",
            width: mediaquary.width / 2.2,
            fit: BoxFit.cover,
          ),
          Text(
            "Modern beige sofa",
            style: theme.textTheme.bodyLarge,
          ),
          Text("EG 60,000", style: theme.textTheme.bodyLarge),
          Text("Cairo, Egypt", style: theme.textTheme.bodyMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ImageIcon(
                AssetImage("assets/image/fav_icon_solid.png"),
                color: theme.primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
