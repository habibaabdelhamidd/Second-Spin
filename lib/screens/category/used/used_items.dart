import 'package:flutter/material.dart';
import 'package:graduation/screens/category/used/used_details.dart';

class UsedItem extends StatelessWidget {
  static const String routeName = "UsedItem";

  const UsedItem({super.key});

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
                    'item name',
                    style: theme.textTheme.bodyMedium
                ),
                Text(
                    'price',
                    style: theme.textTheme.bodyMedium
                ),
                Text(
                    'address',
                    style: theme.textTheme.bodySmall
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'date',
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