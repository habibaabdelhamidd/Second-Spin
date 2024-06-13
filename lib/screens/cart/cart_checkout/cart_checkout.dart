import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/layouts/homelayout/homelayout.dart';
import 'package:graduation/models/home_model.dart';
import 'package:graduation/screens/home/home/home.dart';

class Cart_Chackout extends StatefulWidget {
  @override
  static const String routeName = "cart_chackout";

  @override
  State<Cart_Chackout> createState() => _Cart_ChackoutState();
}


class _Cart_ChackoutState extends State<Cart_Chackout> {
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquary = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(mediaquary.width * 0.02),
              padding: EdgeInsets.all(mediaquary.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: mediaquary.width * 0.02,
                        left: mediaquary.width * 0.02),
                    child: Text(
                      "Payment Summary:",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(mediaquary.width * 0.02),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total", style: theme.textTheme.bodyLarge),
                        Spacer(),
                        Text("EGP 3.500", style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(mediaquary.width * 0.02),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delivary fees", style: theme.textTheme.bodyLarge),
                        Spacer(),
                        Text("EGP 100", style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(mediaquary.width * 0.02),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price", style: theme.textTheme.bodyLarge),
                        Spacer(),
                        Text("EGP 3.600", style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaquary.height /1.7,
                  ),
                  GestureDetector(
                    onTap: (){
                      _showDialog(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(mediaquary.width * 0.04),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Checkout",
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success Purchase" , style: TextStyle(fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
          content:GestureDetector(
              onTap:(){
                Navigator.pushNamed(context, HomeLayout.routeName);
              },
              child: Text("Continue Shopping" , style: TextStyle(fontWeight: FontWeight.w700 ,
                  fontSize: 18),textAlign: TextAlign.center,),),
          actions: [],
        );
      }
  );
}