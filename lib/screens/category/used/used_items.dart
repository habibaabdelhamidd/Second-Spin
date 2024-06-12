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
                Image.network(catData.image!,width: double.infinity ,height: 135,fit: BoxFit.cover, ),
                Text(
                    catData.title ?? "",
                    style: theme.textTheme.bodyMedium
                ),
                Text(
                    catData.price ?? "",
                    style: theme.textTheme.bodyMedium
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      catData.location?? "",
                      style: theme.textTheme.bodySmall
                  ),
                    Icon(Icons.favorite_border_outlined,
                      color: theme.primaryColor,)
                  ],
                )
              ],
            )));
  }
}