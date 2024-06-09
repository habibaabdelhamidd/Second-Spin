import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/recyle/all_recycle_model.dart';

class Recycl_Product_card extends StatelessWidget {
  AllRecycle productRecycl  ;
  Recycl_Product_card(this.productRecycl);
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
            productRecycl.image!,
            width: mediaquary.width / 2.2,
            fit: BoxFit.fill,
          ),
          Text(
            productRecycl.title!,
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            productRecycl.price!,
            style: theme.textTheme.bodyLarge,
          ),
          Text(
            productRecycl.location!,
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
