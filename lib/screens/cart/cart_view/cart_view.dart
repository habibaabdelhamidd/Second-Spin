import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/cart/cart_list_model.dart';
import 'package:graduation/screens/cart/cart_view/cart_card.dart';
import 'package:graduation/screens/cart/vms/cart_list_view_model.dart';
import '../../login/text_ff.dart';
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
  String dropDownValue = items.first;
  TextEditingController creditNum = TextEditingController();
  TextEditingController cvv  = TextEditingController();
  TextEditingController expire  = TextEditingController();
  TextEditingController locationDetails  = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
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
                height: mediaquary.height*0.20,
                child:
            ListView.builder(
              itemBuilder: (context , index)=>CartCard(
              cartM.allCartList[index],
              cartM,
            ),
              itemCount: cartM.allCartList.length,
            )
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
                  controller: locationDetails,
                decoration: InputDecoration(
                    hintText: "Enter Your Location Details",
                    hintStyle: theme.textTheme.bodySmall,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.grey.shade500)
                    )),
              ),
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
            Container(
              margin: EdgeInsets.only(left: mediaquary.width*0.03,
                  right: mediaquary.width*0.03),
              child: TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Credit Card Number',
                  labelStyle: theme.textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                      borderSide:BorderSide(color: Colors.grey.shade500)
                  ),
                ),
                controller:creditNum,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your Credit Card Number";
                  }
                  var regex = RegExp(r'^[0-9]{16}$');
                  if (!regex.hasMatch(value)) {
                    return "Invalid Credit Card Number";
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: [
                Container(
                  width: mediaquary.width/1.8,
                  margin: EdgeInsets.only(left: mediaquary.width*0.03,
                      right: mediaquary.width*0.03,
                    top: mediaquary.width * 0.03
                  ),
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'MM/YY',
                      labelStyle: theme.textTheme.bodySmall,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:BorderSide(color: Colors.grey.shade500)
                      ),
                    ),
                    controller:expire ,
                    keyboardType: TextInputType.datetime,
                    // onTap: () async {
                    //   final DateTime? pickedDate = await showDatePicker(
                    //     context: context,
                    //     initialDate: DateTime.now(),
                    //     firstDate: DateTime(2024),
                    //     lastDate: DateTime.now().add(Duration(days: 2190)),
                    //   );
                    //   if (pickedDate != null) {
                    //     setState(() {
                    //       _selectedDate = pickedDate!;
                    //      _selectedDate != expire ;
                    //     });
                    //   }
                    // },
                    // validator: (value) {
                    //   if (_selectedDate == null) {
                    //     return 'Please select a date';
                    //   }
                    //   else if (_selectedDate.isBefore(DateTime.now())) {
                    //     return 'Date cannot be in the past';
                    //   }
                    //   else if (_selectedDate.isAfter(DateTime.now().subtract(Duration(days:2190)))) {
                    //     return "";
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                Container(
                  width: mediaquary.width/3.2,
                  margin: EdgeInsets.only(left: mediaquary.width*0.03,
                      right: mediaquary.width*0.03,
                      top: mediaquary.width * 0.03
                  ),
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      labelStyle: theme.textTheme.bodySmall,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:BorderSide(color: Colors.grey.shade500)
                      ),
                    ),
                    controller:cvv,
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your Secure Code";
                      }
                      var regex = RegExp(r'^[0-9]{3}$');
                      if (!regex.hasMatch(value)) {
                        return "Invalid Secure Code";
                      }
                      return null;
                    },
                  ),
                ),
              ],
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
