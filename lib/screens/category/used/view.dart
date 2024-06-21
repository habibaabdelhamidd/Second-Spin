import 'package:flutter/material.dart';
import 'package:graduation/screens/category/used/used_category.dart';
import '../../../models/response/Data.dart';

class ViewCategoryList extends StatelessWidget {
  final Category category;
  const ViewCategoryList(this.category,{super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  InkWell(
      onTap: () {
        Navigator.pushNamed(context, UsedCategory.routeName , arguments: category);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home, color: theme.primaryColor),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Text(category.name ?? "",
              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500).copyWith(fontFamily: "poppins")),
         const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
          )
        ],
      ),
    );
  }
}
