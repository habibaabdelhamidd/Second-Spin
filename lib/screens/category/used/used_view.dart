import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import 'package:graduation/screens/category/used/view.dart';

class UsedView extends StatelessWidget {
  static const String routeName = "UsedView";
   const UsedView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
        title: const Text("Options"),
        ),
        body:  FutureBuilder(
        future: Api_Manager.getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Center(
                child: Text(
                  snapshot.data?.message ?? snapshot.error.toString(),
              style: const TextStyle(color: Colors.black),
            ));
          }
          var categoryList = snapshot.data?.data;
          return Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                        ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    itemCount: categoryList?.length ?? 0,
                    itemBuilder: (context, index) =>ViewCategoryList(categoryList![index])),
              );
        }),
        );
  }
}
