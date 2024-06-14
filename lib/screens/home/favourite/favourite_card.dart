import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/fav/addtofav/add_to_fav.dart';

class Favourite_card extends StatelessWidget {
  FavProductList  favProducts ;
  Favourite_card(this.favProducts);
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
          Image.network(
            favProducts.image!,
            width:double.infinity,
            height: mediaquary.height*0.2,
            fit: BoxFit.cover,
          ),
          Text(
            favProducts.title!,
            style: theme.textTheme.bodyLarge,
          ),
          Text(favProducts.price!, style: theme.textTheme.bodyLarge),
          Text(favProducts.location!, style: theme.textTheme.bodyMedium),
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
