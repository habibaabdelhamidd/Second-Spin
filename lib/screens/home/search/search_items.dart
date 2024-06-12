import 'package:flutter/material.dart';
import 'package:graduation/models/categories_response/category_data.dart';

import 'search_details.dart';

class SearchItem extends StatelessWidget {
  static const String routeName = "SearchItem";
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments as CategoryData;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SearchDetails.routeName);

      }
        ,
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
                  args.title??"",
                  style: theme.textTheme.bodyMedium
                  ),
                Text(
                  args.price??"",
                  style: theme.textTheme.bodyMedium
                ),
                Text(
                  args.location??"",
                  style: theme.textTheme.bodySmall
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.favorite_border_outlined, color: theme.primaryColor,)
                  ],
                )
              ],
            )));
  }
}
