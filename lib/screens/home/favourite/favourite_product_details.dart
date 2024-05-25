import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourite_product_details extends StatelessWidget {
  @override
  static const String routeName = "favourite product details";

  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text(
          "Product details",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(mediaquary.width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image.asset(
                    "assets/image/favimage.png",
                    width: mediaquary.width,
                    fit: BoxFit.fill,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          right: mediaquary.width * 0.02,
                          bottom: mediaquary.width * 0.02),
                      padding: EdgeInsets.all(mediaquary.width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        "assets/image/fav_icon_solid.png",
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: mediaquary.width * 0.02,
                    bottom: mediaquary.width * 0.01),
                child: Text(
                  "Modern beige sofa",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur scing "
                  "elit. Suspendisse, Curabitur vehicula "
                  "tellus vel lorem commodo.",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Color(0xffA7A7A7))),
              Text("Cairo, Egypt", style: theme.textTheme.bodyMedium),
              Container(
                padding: EdgeInsets.all(mediaquary.width * 0.05),
                margin: EdgeInsets.symmetric(
                    vertical: mediaquary.width * 0.02,
                    horizontal: mediaquary.width * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffEFEEEE),
                ),
                child: Row(
                  children: [
                    Text(
                      "Price:",
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: mediaquary.width / 3.5,
                    ),
                    Text(
                      "EG 60,000",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaquary.height / 7,
              ),
              Container(
                padding: EdgeInsets.all(mediaquary.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.10),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(mediaquary.width * 0.03),
                  margin: EdgeInsets.all(mediaquary.width * 0.02),
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage("assets/image/homecart.png"),
                        color: Colors.white,
                        size: 30,
                      ),
                      Text("Add to cart",
                          style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
