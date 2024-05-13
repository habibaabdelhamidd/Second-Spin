import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recycl_Product_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquare = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/image/laptop.jpeg",
            width: mediaquare.width / 2.5,
            fit:BoxFit.fill,
          ),
          Text(
            "Apple MacBook Pro 13",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "EG 60,000",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Madinaty, Egypt",
            style: TextStyle(fontSize: 10, color: Color(0xff7a7a7a)),
          ),
          Row(
            children: [
              Text(
                "22 May",
                style: TextStyle(fontSize: 10, color: Color(0xff7a7a7a)),
              ),
              Spacer(),
              Image.asset("assets/image/Icon fav.png"),
            ],
          ),
        ],
      ),
    );
  }
}
