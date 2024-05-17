import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
import 'package:graduation/screens/sell/form/camera.dart';

List<String> items = <String>[
  'Used item',
  'Recycle Item',
];

class SellForm extends StatelessWidget {
  static const String routeName = "SellForm";
  final String? imagePath;
  SellForm({super.key, this.imagePath});

  String dropDownValue = items.first;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Include details",
            style: theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, FormCamera.routeName);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: imagePath == null || imagePath!.isEmpty ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo_outlined,
                          color: theme.primaryColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Add images",
                          style: theme.textTheme.labelMedium
                              ?.copyWith(color: theme.primaryColor),
                        ),
                        Text(
                          "Take a photo of your item",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.primaryColor),
                        )
                      ],
                    ) : Image.file(File(imagePath!),fit: BoxFit.cover,
                  ),
                ) ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Ad title *",
                  style: theme.textTheme.labelMedium,
                ),
                TextF(hint: "Enter item Name", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Choose item category *",
                  style: theme.textTheme.labelMedium,
                ),
                // DropdownButton<String>(
                //     style: theme.textTheme.labelSmall,
                //     padding: EdgeInsets.all(
                //         MediaQuery.of(context).size.width * 0.02),
                //     isExpanded: true,
                //     value: dropDownValue,
                //     icon: const Icon(Icons.keyboard_arrow_down),
                //     items: items.map<DropdownMenuItem<String>>((String items) {
                //       return DropdownMenuItem<String>(
                //         value: items,
                //         child: Text(items),
                //       );
                //     }).toList(),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         dropDownValue = newValue!;
                //       });
                //     }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "Describe Your item *",
                  style: theme.textTheme.labelMedium,
                ),
                TextF(hint: "Describe What Are You Selling?", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Tell Us Your Story",
                  style: theme.textTheme.labelMedium,
                ),
                TextF(hint: "Tell Us Your Story?", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Location details *",
                  style: theme.textTheme.labelMedium,
                ),
                TextF(hint: "Enter your location details", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Price *",
                  style: theme.textTheme.labelMedium,
                ),
                TextF(hint: "Enter item Price", astrik: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Buttons(title: "Submit", padd: 15)
              ],
            ),
          ),
        ));
  }
}
