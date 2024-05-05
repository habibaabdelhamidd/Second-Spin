import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/category/recycle/recycle_products/recycle_products.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Buying options",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 35, right: 20, left: 20),
              margin: EdgeInsets.only(top: 20, bottom: 20, right: 30, left: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Used Products",
                        style: theme.textTheme.titleLarge,
                      ),
                      Spacer(),
                      Image.asset("assets/image/options.png")
                    ],
                  ),
                  Text(
                    "Category Used product",
                    style: TextStyle(color: Color(0XFFc5c5c5), fontSize: 15),
                  ),
                  Container(
                    width: 400,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.colorScheme.primary),
                    child: Text(
                      "Browse",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 35, right: 20, left: 20),
              margin: EdgeInsets.only(top: 20, bottom: 20, right: 30, left: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Recycle Products",
                        style: theme.textTheme.titleLarge,
                      ),
                      Image.asset("assets/image/options.png")
                    ],
                  ),
                  Text(
                    "Category Product with less price for recycle",
                    style: TextStyle(color: Color(0XFFc5c5c5), fontSize: 15),
                  ),
                  Container(
                    width: 400,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.colorScheme.primary),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RecycleViewProducts.routeName);
                      },
                      child: Text(
                        "Browse",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 35, right: 20, left: 20),
              margin: EdgeInsets.only(top: 20, bottom: 20, right: 30, left: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Charity Products",
                        style: theme.textTheme.titleLarge,
                      ),
                      Image.asset("assets/image/options.png")
                    ],
                  ),
                  Text(
                    "Category Charity Products",
                    style: TextStyle(color: Color(0XFFc5c5c5), fontSize: 15),
                  ),
                  Container(
                    width: 400,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.colorScheme.primary),
                    child: Text(
                      "Donate",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
