import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_Chackout extends StatefulWidget{
  @override
  static const String routeName = "cart_chackout";

  @override
  State<Cart_Chackout> createState() => _Cart_ChackoutState();
}
List<String> options = ["Credit card" , "cash" ,];
class _Cart_ChackoutState extends State<Cart_Chackout> {
  String currentOption = options[0];
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text("Location Details", style: theme.textTheme.bodyMedium!
                        .copyWith(fontWeight:FontWeight.w700),),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Location Details",
                      hintStyle: theme.textTheme.bodySmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade500
                        )
                      )
                  ),
                  ),
                 SizedBox(height: 25,),
                 Container(
                   margin: EdgeInsets.all(5),
                   width: double.infinity,
                   height: 2,
                   color: Colors.grey.shade400,
                 ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0 , left: 5),
                    child: Text("Payment Method:", style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 16 , fontWeight: FontWeight.w700
                    ),),
                  ),
                  RadioListTile(
                    title: Row(children: [
                      ImageIcon(AssetImage("assets/image/credit-card.png"), color: Colors.black,),
                      SizedBox(width: 10,),
                      Text("Credit Card:", style: theme.textTheme.bodyMedium),
                    ],),
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
                      ImageIcon(AssetImage("assets/image/cash.png",),color: Colors.black,),
                        SizedBox(width: 10,),
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
                  SizedBox(height: 15,),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: double.infinity,
                    height: 2,
                    color: Colors.grey.shade400,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0 , left: 5),
                    child: Text("Payment Summary:", style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 16 , fontWeight: FontWeight.w700
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all( 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total" , style: theme.textTheme.bodyLarge),
                        Spacer(),
                        Text("EGP 3.500", style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all( 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delivary fees" , style: theme.textTheme.bodyLarge),
                        Spacer(),
                        Text("EGP 100", style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price" , style: theme.textTheme.bodyLarge),
                        Spacer(),
                        Text("EGP 3.600", style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  SizedBox(height: 300,),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Checkout",
                      style:theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                  )
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