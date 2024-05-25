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
              padding: EdgeInsets.all(mediaquary.width * 0.006),
              margin: EdgeInsets.all(mediaquary.width * 0.02),
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
                    padding: EdgeInsets.only(
                        top: mediaquary.width * 0.02,
                        left: mediaquary.width * 0.03,
                        bottom: mediaquary.width * 0.01),
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
              height: mediaquary.height / 1.8,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(mediaquary.width * 0.04),
                margin: EdgeInsets.all(mediaquary.width * 0.02),
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
