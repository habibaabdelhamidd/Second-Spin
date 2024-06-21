import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import '../cart_checkout/cart_checkout.dart';
import 'cart_view.dart';
List<String> items = <String>[
  'Cairo ','Giza', 'Demietta', "Gharbia" ,"Beni suef" , "Asute" , "Beheria" ,
  "Fayoum" , "Aswan " , "Dekahlia"
];
TextEditingController creditNum = TextEditingController();
TextEditingController cvV  = TextEditingController();
TextEditingController expire  = TextEditingController();
TextEditingController userLocationDetails  = TextEditingController();
String? currentPaymentMethodOptions ;
String dropDownValue = items.first;
late final dropDownCurrentValue ;
class CartUserData extends StatefulWidget{
  static const String routeName = "cart_user";
  @override
  State<CartUserData> createState() => _CartUserDataState();
}
List<String> options = [
  "Credit card",
  "cash",
];
class _CartUserDataState extends State<CartUserData> {

  var formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  @override
  String currentOption = options[0];

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
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
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
                 dropDownCurrentValue =dropDownValue ;
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
             controller: userLocationDetails,
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
               currentPaymentMethodOptions =currentOption;
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
                 validator: (String? value) {
                   if (value == null || value.trim().isEmpty) {
                     return "Please enter your expiry date";
                   }
                   final date =DateTime.parse(value);
                   if(date.isBefore(DateTime.now())){
                     return "it cannot be in past";
                   }
                   var regex = RegExp(r'^[0-9]{5}$' );
                   if (!regex.hasMatch(value)) {
                     return "Invalid Secure Code";
                   }
                   return null;
                 },
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
                 controller:cvV,
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
         // SizedBox(height: mediaquary.height*0.27,),
         GestureDetector(
           onTap: () {
             Navigator.pushNamed(context, Cart_Chackout.routeName);
             Api_Manager.checkoutData();
             print(currentPaymentMethodOptions);
             print(cvV.text);
             print(expire.text);
             print(userLocationDetails.text);
             print(creditNum.text);
             print(dropDownCurrentValue);
             print("send");
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
     ),
   );
  }
}