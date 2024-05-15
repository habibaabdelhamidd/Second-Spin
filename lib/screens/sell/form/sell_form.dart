import 'package:flutter/material.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
List<String> items = <String>[
  'Used item','Recycle Item',
];
class SellForm extends StatefulWidget {
  static const String routeName = "SellForm";
  const SellForm({super.key});

  @override
  State<SellForm> createState() => _SellFormState();
}

class _SellFormState extends State<SellForm> {

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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "Describe Your item *",
                      style: theme.textTheme.labelMedium,
                    ),
                    TextF(
                        hint: "Describe What Are You Selling?", astrik: false),
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
