import 'package:flutter/material.dart';
import 'package:graduation/models/search_response/Data.dart';

import 'search_details.dart';

class SearchItem extends StatelessWidget {
  static const String routeName = "SearchItem";
  final SearchData args;
  const SearchItem(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SearchDetails.routeName, arguments: args);

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
                Image.network(
                  args.image!,
                  width: double.infinity,
                  height: 135,
                  fit: BoxFit.cover,
                ),
                Text(
                  args.title??"",
                  style: theme.textTheme.labelMedium
                  ),
                Text(
                  args.price??"",
                  style: theme.textTheme.bodyMedium
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      args.location??"",
                      style: theme.textTheme.bodySmall
                  ),
                    Icon(Icons.favorite_border_outlined, color: theme.primaryColor,)
                  ],
                )
              ],
            )));
  }
}
