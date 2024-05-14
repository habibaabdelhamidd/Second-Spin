import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/category/recycle/recycle_product_details/recycle_products_details.dart';
import 'package:graduation/screens/category/recycle/recycle_products/recycle_product_card.dart';

class RecycleViewProducts extends StatelessWidget {
  @override
  static const String routeName = "recycle_view_products";

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquare = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text("Recycle", style: theme.appBarTheme.titleTextStyle,),
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6
                ),
                itemBuilder: (context, index) =>
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Recycle_Product_Details.routeName);
                        },
                        child: Recycl_Product_card()),
              )
          ),

        ],
      ),
    );
  }

}