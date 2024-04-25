import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/layouts/homelayout/homelayout.dart';

class Onboarding3 extends StatelessWidget {
  static const String routeName = "onboarding3";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/image/On boarding 03.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff757575),
              size: 25,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("assets/image/boarding 3.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "you can now offer your on a product to "
                          "seller and start negotiation with him.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0XFF2B3139),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width:360,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff7AAB99),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 8, bottom: 8, top: 12),
                      child: GestureDetector(
                        onTap: (){
                          // Navigator.pushNamed(context, HomeLayout.routeName);
                        },
                        child: Text(
                          "Get Start ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFFffffff),
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
