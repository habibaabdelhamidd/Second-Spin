import 'package:flutter/material.dart';
import 'package:graduation/screens/category/used/used_category.dart';

class UsedView extends StatelessWidget {
  static const String routeName = "UsedView";
  const UsedView({super.key,});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text("Options"),
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical:20),
                ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            itemCount: 12,
            itemBuilder: (context, index) =>  GestureDetector(
              onTap: (){Navigator.pushNamed(context, UsedCategory.routeName);},
              child: Row(
              children: [
              Icon(Icons.home, color: theme.primaryColor),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                        Text("Properties", style: theme.textTheme.bodyMedium?.copyWith(fontFamily: "poppins")),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.45,),
                        const Icon(Icons.arrow_forward_ios_outlined,)

                        ],
                      ),
            )));
  }
}
