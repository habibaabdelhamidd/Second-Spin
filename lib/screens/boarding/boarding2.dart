import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/boarding/onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  static const String routeName = "onboarding2";
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaqurery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset("assets/image/On boarding 02.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:AppBar(
            iconTheme: IconThemeData(
              color: theme.appBarTheme.iconTheme?.color,
              size: 25,
            ),
            elevation: 0,
            title: Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(mediaqurery.width*0.02),
                  child: Text("Skip",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF757575)),),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("assets/image/boarding2.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "you can now sell your products fasterby making "
                          "it featured to be seen by more users",
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
                        onTap: (){
                          Navigator.pushNamed(context, Onboarding3.routeName);
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
    );
  }
}
