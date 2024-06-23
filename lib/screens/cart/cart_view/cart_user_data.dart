import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import '../cart_checkout/cart_checkout.dart';
import 'cart_view.dart';
class CartUserData extends StatefulWidget {
  static const String routeName = "cart_user";
  @override
  State<CartUserData> createState() => _CartUserDataState();
}
class _CartUserDataState extends State<CartUserData> {
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    dropDownCurrentValue = items.first;
    currentOption =  options[0];
  }
  List<String> items = <String>[
    'Cairo ',
    'Giza',
    'Demietta',
    "Gharbia",
    "Beni suef",
    "Asute",
    "Beheria",
    "Fayoum",
    "Aswan ",
    "Dekahlia"
  ];
  List<String> options = [
    "credit card",
    "cash",
  ];
  TextEditingController creditNum = TextEditingController();
  TextEditingController cvV = TextEditingController();
  TextEditingController expire = TextEditingController();
  TextEditingController userLocationDetails = TextEditingController();
 // late String dropDownValue ;
  late String? dropDownCurrentValue;
  String? payment;
 late String currentOption ;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquary = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Row(
          children: [
            Text(
              "Cart User Data",
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
      body:
      SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: mediaquary.width * 0.02, top: mediaquary.width * 0.02),
                    child: Text(
                      "Location",
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                  DropdownButton<String>(
                      style: theme.textTheme.labelSmall,
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                      isExpanded: true,
                      value: dropDownCurrentValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map<DropdownMenuItem<String>>((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          // dropDownValue = newValue!;
                          dropDownCurrentValue = newValue!;
                        });
                      }),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: mediaquary.width * 0.02, left: mediaquary.width * 0.02),
                    child: Text(
                      "Location Details",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: mediaquary.width * 0.02, right: mediaquary.width * 0.02),
                    child: TextFormField(
                        controller: userLocationDetails,
                        decoration: InputDecoration(
                            hintText: "Enter Your Location Details",
                            hintStyle: theme.textTheme.bodySmall,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade500))),
                        validator: (String? value) {
                          if (value!.length < 10  ) {
                            return "your entered location must be at least 10 characters";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: mediaquary.width * 0.02, left: mediaquary.width * 0.02),
                    child: Text(
                      "Payment Method:",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  RadioListTile<String>(
                      title: Text('credit card'),
                      value: 'credit card',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value;
                        });
                      }),
                  payment == 'credit card' ?Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: mediaquary.width * 0.03, right: mediaquary.width * 0.03),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Credit Card Number',
                            labelStyle: theme.textTheme.bodySmall,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade500)),
                          ),
                          controller: creditNum,
                          validator: (String ?value) {
                            var regex = RegExp(r'^[0-9]{16}$');
                            if (!regex.hasMatch(value!)) {
                              return "Invalid Credit Card Number";
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: mediaquary.width / 1.8,
                            margin: EdgeInsets.only(
                                left: mediaquary.width * 0.03,
                                right: mediaquary.width * 0.03,
                                top: mediaquary.width * 0.03),
                            child: TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'MM/YY',
                                labelStyle: theme.textTheme.bodySmall,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:BorderSide(color: Colors.grey.shade500)),
                              ),
                              controller: expire,
                              validator: (String? value) {
                                final parts = value!.split('/');
                                if (parts.length != 2) {
                                  return 'Invalid expiration date format';
                                }
                                final month = int.tryParse(parts[0]);
                                final year = int.tryParse(parts[1]);
                                if (month == null || year == null || month < 1 || month > 12) {
                                  return 'Invalid expiration date';
                                }
                                final currentYear = DateTime.now().year % 100;
                                final currentMonth = DateTime.now().month;
                                final maxExpirationYear = currentYear + 5;
                                if (year < currentYear || (year == currentYear && month < currentMonth || year > maxExpirationYear)) {
                                  return 'Expiration date has passed';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: mediaquary.width / 3.2,
                            margin: EdgeInsets.only(
                                left: mediaquary.width * 0.03,
                                right: mediaquary.width * 0.03,
                                top: mediaquary.width * 0.03),
                            child: TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                labelStyle: theme.textTheme.bodySmall,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade500)),
                              ),
                              controller: cvV,
                              validator: (String? value) {
                                var regex = RegExp(r'^[0-9]{3}$');
                                if (!regex.hasMatch(value!)) {
                                  return "Invalid Secure Code";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ):SizedBox(),
                  RadioListTile<String>(
                      title: Text('cash'),
                      value: 'cash',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value;
                        });
                      }),
                 ]),
                 SizedBox(height: mediaquary.height/3,),
                 Column(
                   children: [
                     GestureDetector(
                       onTap: () {
                         if (formKey.currentState!.validate()) {
                           Navigator.pushNamed(context, Cart_Chackout.routeName);
                           Api_Manager.sendCheckoutRequest(
                               currentPayment: payment ! , locataionCity: dropDownCurrentValue!,
                               locationDetails : userLocationDetails.text , creditCardN: creditNum.text ,
                               cardCvv: cvV.text , expiryDate: expire.text);
                         }else {
                           print("please check validation");
                         }
                       },
                       child: Container(
                           width: double.infinity,
                           padding: EdgeInsets.all(mediaquary.width * 0.04),
                           margin: EdgeInsets.all(mediaquary.width * 0.02),
                           decoration: BoxDecoration(
                               color: theme.primaryColor,
                               borderRadius: BorderRadius.circular(10)),
                           child: Text(
                             "Next",
                             style: theme.textTheme.bodyLarge!.copyWith(
                               color: Colors.white,
                             ),
                             textAlign: TextAlign.center,
                           )),
                     )
                   ],
                 )
                ],
              ),
        ),
      ),
    );
  }
}
