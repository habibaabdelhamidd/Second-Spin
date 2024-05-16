import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../cart_checkout/cart_checkout.dart';
class Cart_view_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquary = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Row(
          children: [
            Text(
              "Cart",
              style: theme.appBarTheme.titleTextStyle,
            ),
            Spacer(),
            ImageIcon(
              AssetImage(
                "assets/image/homecart.png",
              ),
              color: theme.primaryColor,
              size: 25,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color(0xffCCCCCC),
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/image/snkeers.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 8, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sneakers Air Jordon",
                          style: theme.textTheme.bodyLarge,
                        ),
                        Text(
                          "EGP 3,500",
                          style: theme.textTheme.bodyLarge,
                        ),
                        Text(
                          "Giza, Egypt",
                          style: theme.textTheme.bodyMedium,
                        ),
                        Icon(
                          Icons.delete_outline,
                          color: Colors.grey.shade500,
                          size: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaquary.height,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Cart_Chackout.routeName);
                  },
                  child: Text(
                    "Next",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
