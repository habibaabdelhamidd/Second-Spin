import 'package:flutter/material.dart';
import 'package:graduation/screens/category/recycle/recycle_products/recycle_products.dart';
import '../used/used_view.dart';

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
              margin: EdgeInsets.only(top: 50, bottom: 20, right: 30, left: 30),
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
                        "Used \nProducts",
                        style: theme.textTheme.titleLarge,
                      ),
                      Spacer(),
                      Image.asset("assets/image/options.png")
                    ],
                  ),
                  Text(
                    "Category \nUsed product",
                    style: TextStyle(color: Color(0XFFc5c5c5), fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, UsedView.routeName);
                    },
                    child: Container(
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
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50,),
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
                        "Recycle \nProducts",
                        style: theme.textTheme.titleLarge,
                      ),
                      Spacer(),
                      Image.asset("assets/image/options.png")
                    ],
                  ),
                  Text(
                    "Category \nProduct with less price for recycle",
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
          ],
        ),
      ),
    );
  }
}
