import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
import 'package:graduation/screens/sell/form/charity_camera.dart';
import '../../../core/shared_preference.dart';
import '../../../models/Donation/DonationFormRes.dart';
import 'package:http/http.dart' as http;

List<String> items = <String>[
  'Al-Orman',
  'Resala',
];

class CharityForm extends StatefulWidget {
  static const String routeName = "CharityForm";
  final String? imagePath;

  const CharityForm({super.key, this.imagePath});

  @override
  State<CharityForm> createState() => _CharityFormState();
}

class _CharityFormState extends State<CharityForm> {
  TextEditingController titleControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();
  TextEditingController locationControl = TextEditingController();
  String? imagePath;
  String dropDownValue = items.first;
  Future<DonationFormRes> donate(
    String? description,
    String? title,
    String? location,
    String? imagePath,
  ) async {
    String? token = await Preference.getToken();
    var response =
        await http.post(Uri.parse("http://secondspin.xyz/api/donations/store"),
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
              HttpHeaders.contentTypeHeader: "application/json",
            },
            body: jsonEncode(<String, dynamic>{
              "description": description,
              "title": title,
              "location": location,
              "image": imagePath,
            }));
    if (response.statusCode == 201) {
      print(response.body);
    }
    final result = jsonDecode(response.body);
    print(response.body);
    var donationResponse = DonationFormRes.fromJson(result);
    return donationResponse;
  }

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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CharityCamera.routeName);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: widget.imagePath == null || widget.imagePath!.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_a_photo_outlined,
                                        color: theme.primaryColor,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Text(
                                        "Add images",
                                        style: theme.textTheme.labelMedium
                                            ?.copyWith(
                                                color: theme.primaryColor),
                                      ),
                                      Text(
                                        "Take a photo of your item",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                                color: theme.primaryColor),
                                      )
                                    ],
                                  )
                                : Image.file(
                                    File(widget.imagePath!),
                                    fit: BoxFit.cover,
                                  ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Ad title *",
                        style: theme.textTheme.labelMedium,
                      ),
                      TextF(
                        hint: "Enter item Name",
                        astrik: false,
                        textEditingController: titleControl,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Describe Your item *",
                        style: theme.textTheme.labelMedium,
                      ),
                      TextF(
                        hint: "Describe What Are You Selling?",
                        astrik: false,
                        textEditingController: descriptionControl,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Location details *",
                        style: theme.textTheme.labelMedium,
                      ),
                      TextF(
                        hint: "Enter your location details",
                        astrik: false,
                        textEditingController: locationControl,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Choose charity *",
                        style: theme.textTheme.labelMedium,
                      ),
                      DropdownButton<String>(
                          style: theme.textTheme.labelSmall,
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.02),
                          isExpanded: true,
                          value: dropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items
                              .map<DropdownMenuItem<String>>((String items) {
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
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                  onPressed: () {
                    donate(descriptionControl.text, titleControl.text,
                        locationControl.text, imagePath);
                  },
                  child: Buttons(title: "Submit", padd: 17))
            ],
          ),
        ));
  }
}
