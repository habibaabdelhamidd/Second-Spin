import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/cart/cart_list_model.dart';
import 'package:graduation/screens/cart/cart_view/cart_card.dart';
import 'package:graduation/screens/cart/cart_view/cart_user_data.dart';
import 'package:graduation/screens/cart/vms/cart_list_view_model.dart';
import '../../login/text_ff.dart';
import '../cart_checkout/cart_checkout.dart';
class Cart_view_Screen extends StatefulWidget {
  @override
  State<Cart_view_Screen> createState() => _Cart_view_ScreenState();
}
class _Cart_view_ScreenState extends State<Cart_view_Screen> {
  late CartListViewModel cartM;
  late CartList cartlist ;
  @override
  void initState() {
    super.initState();
    cartM = CartListViewModel();
    futureCartList();
  }
  Future<void> futureCartList() async {
    await cartM.getAllCartProducts();
    setState(() {});
  }
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
              height: mediaquary.height/1.4,
                child:
            ListView.builder(
              itemBuilder: (context , index)=>CartCard(
              cartM.allCartList[index],
              cartM,
            ),
              itemCount: cartM.allCartList.length,
            )
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
                    Navigator.pushNamed(context, CartUserData.routeName);
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
