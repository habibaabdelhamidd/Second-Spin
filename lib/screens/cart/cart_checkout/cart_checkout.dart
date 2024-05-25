import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_Chackout extends StatefulWidget {
  @override
  static const String routeName = "cart_chackout";

  @override
  State<Cart_Chackout> createState() => _Cart_ChackoutState();
}

List<String> options = [
  "Credit card",
  "cash",
];

class _Cart_ChackoutState extends State<Cart_Chackout> {
  String currentOption = options[0];

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
                    padding: EdgeInsets.only(bottom: mediaquary.width * 0.02),
                    child: Text(
                      "Location Details",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Your Location Details",
                        hintStyle: theme.textTheme.bodySmall,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade500))),
                  ),
                  SizedBox(
                    height: mediaquary.height * 0.03,
                  ),
                  Container(
                    margin: EdgeInsets.all(mediaquary.width * 0.01),
                    width: double.infinity,
                    height: mediaquary.height * 0.002,
                    color: Colors.grey.shade400,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: mediaquary.width * 0.02,
                        left: mediaquary.width * 0.02),
                    child: Text(
                      "Payment Method:",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  RadioListTile(
                    title: Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/image/credit-card.png"),
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: mediaquary.width * 0.01,
                        ),
                        Text("Credit Card:", style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    value: options[0],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Row(
                      children: [
                        ImageIcon(
                          AssetImage(
                            "assets/image/cash.png",
                          ),
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: mediaquary.width * 0.01,
                        ),
                        Text("Cash:", style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    value: options[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                  SizedBox(
                    height: mediaquary.height * 0.003,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: double.infinity,
                    height: 2,
                    color: Colors.grey.shade400,
                  ),
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
                    height: mediaquary.height * 0.3,
                  ),
                  Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
