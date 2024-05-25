import 'package:flutter/material.dart';
import 'package:graduation/screens/category/recycle/recycle_products/recycle_products.dart';
import '../used/used_view.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
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
              padding: EdgeInsets.only(
                  top: mediaquary.width * 0.05,
                  bottom: mediaquary.width * 0.08,
                  right: mediaquary.width * 0.04,
                  left: mediaquary.width * 0.04),
              margin: EdgeInsets.only(
                  top: mediaquary.width * 0.1,
                  bottom: mediaquary.width * 0.1,
                  right: mediaquary.width * 0.06,
                  left: mediaquary.width * 0.06),
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
                    onTap: () {
                      Navigator.pushNamed(context, UsedView.routeName);
                    },
                    child: Container(
                      width: mediaquary.width * 0.9,
                      margin: EdgeInsets.only(top: mediaquary.width * 0.04),
                      padding: EdgeInsets.all(mediaquary.width * 0.04),
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
            SizedBox(
              height: mediaquary.height / 20,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: mediaquary.width * 0.05,
                  bottom: mediaquary.width * 0.08,
                  right: mediaquary.width * 0.04,
                  left: mediaquary.width * 0.04),
              margin: EdgeInsets.only(
                  top: mediaquary.width * 0.1,
                  bottom: mediaquary.width * 0.1,
                  right: mediaquary.width * 0.06,
                  left: mediaquary.width * 0.06),
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
                    width: mediaquary.width * 0.9,
                    margin: EdgeInsets.only(top: mediaquary.width * 0.04),
                    padding: EdgeInsets.all(mediaquary.width * 0.04),
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
