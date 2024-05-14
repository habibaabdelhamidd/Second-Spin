import 'package:flutter/material.dart';
import 'package:graduation/screens/category/used/used_items.dart';

class UsedCategory extends StatelessWidget {
  static const String routeName = "UsedCategory";
  const UsedCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(args.toString(),style: theme.appBarTheme.titleTextStyle,),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: 12,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7
            ),
            itemBuilder: (context, index) => const UsedItem())
    );
  }
}
