import 'package:flutter/material.dart';
import 'package:graduation/models/categories_response/category_data.dart';
import 'package:graduation/screens/category/used/used_details.dart';

class UsedItem extends StatelessWidget {
  static const String routeName = "UsedItem";
final CategoryData catData;
  const UsedItem(this.catData,{super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, UsedDetails.routeName);
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage("assets/image/SearchEx.png"),),
                Text(
                    catData.title ?? "",
                    style: theme.textTheme.bodyMedium
                ),
                Text(
                    catData.price ?? "",
                    style: theme.textTheme.bodyMedium
                ),
                Text(
                    catData.location?? "",
                    style: theme.textTheme.bodySmall
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.favorite_border_outlined,
                      color: theme.primaryColor,)
                  ],
                )
              ],
            )));
  }
}