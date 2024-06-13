import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/sell/form/charity_form.dart';
import '../cart_checkout/cart_checkout.dart';
List<String> items = <String>[
  'Cairo ','Giza', 'Demietta', "Gharbia" ,"Beni suef" , "Asute" , "Beheria" ,
  "Fayoum" , "Aswan " , "Dekahlia"
];
class Cart_view_Screen extends StatefulWidget {
  @override
  State<Cart_view_Screen> createState() => _Cart_view_ScreenState();
}
List<String> options = [
  "Credit card",
  "cash",
];
class _Cart_view_ScreenState extends State<Cart_view_Screen> {

  String dropDownValue = items.first;
  @override
  String currentOption = options[0];
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
            Padding(
              padding:  EdgeInsets.only(left: mediaquary.width*0.02  ,
                  top: mediaquary.width*0.02),
              child: Text("Location"
              ,  style: theme.textTheme.labelMedium,
              ),
            ),
            DropdownButton<String>(
                style: theme.textTheme.labelSmall,
                padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.02),
                isExpanded: true,
                value: dropDownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items:
                items.map<DropdownMenuItem<String>>((String items) {
                  return DropdownMenuItem<String>(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                }),
            Padding(
              padding: EdgeInsets.only(bottom: mediaquary.width * 0.02 ,
                  left: mediaquary.width*0.02),
              child: Text(
                "Location Details",
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: mediaquary.width*0.02 , right:mediaquary.width*0.02 ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Your Location Details",
                    hintStyle: theme.textTheme.bodySmall,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.grey.shade500))),
              ),
            ),
            SizedBox(
              height: mediaquary.height * 0.03,
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
              height: mediaquary.height*0.09,
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
