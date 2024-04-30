import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/boarding/boarding2.dart';

class Onboarding1 extends StatelessWidget {
  static const String routeName = "onboarding1";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Stack(
        children: [
          Image.asset("assets/image/On boarding 01.png"),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 320,
                    ),
                    Container(
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF757575)),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/image/bording1.png"),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "The best simple place where you "
                        "discover most wonderful used and new Products.",
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
                    SizedBox(
                      width: 300,
                    ),
                    Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8, bottom: 8, top: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,Onboarding2.routeName,);
                          },
                          child: Text(
                            "Next",
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
      ),
    );
  }
}
