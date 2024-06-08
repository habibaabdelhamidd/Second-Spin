import 'package:flutter/material.dart';
import 'package:graduation/models/response/Data.dart';
import 'package:graduation/screens/category/used/used_items.dart';
import '../../../core/network_layer/api_manager.dart';

class UsedCategory extends StatelessWidget {
  static const String routeName = "UsedCategory";
  const UsedCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            args.name??"",
            style: theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: FutureBuilder(
            future: Api_Manager.getCategory(args.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
              if (snapshot.hasError || snapshot.data == null) {
                return const Center(
                    child: Text(
                  "error",
                  style: TextStyle(color: Colors.white),
                ));
              }
              var productsList = snapshot.data?.data;
              return Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: productsList?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.7),
                      itemBuilder: (context, index) => UsedItem(productsList![index])));
            }));
  }
}
