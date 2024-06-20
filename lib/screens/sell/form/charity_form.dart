import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/models/charities_response/CharitiesResponse.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
import 'package:graduation/screens/sell/form/charity_camera.dart';
import '../../../core/network_layer/api_manager.dart';
import '../../../core/shared_preference.dart';
import '../../../models/Donation/DonationFormRes.dart';
import 'package:http/http.dart' as http;

import '../../category/used/used_view.dart';

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
  TextEditingController locationDetailsControl = TextEditingController();
  TextEditingController locationControl = TextEditingController();
  String? imagePath;

  Future<DonationFormRes> donate(
    String? description,
    String? title,
    String? location,
    String? locationDetails,
    String? imagePath,
    num? charityId,
  ) async {
    String? token = await Preference.getToken();
    var response = await http.post(
        Uri.parse("http://secondspin.xyz/api/donations/store/$charityId"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "description": description,
          "title": title,
          "location": location,
          "location_details": locationDetails,
          "image": imagePath,
          "charity_id": charityId,
        }));
    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);
      print(response.body);
      var donationResponse = DonationFormRes.fromJson(result);
      return donationResponse;
    } else {
      print(response.statusCode);
    }
    final result = jsonDecode(response.body);
    print(response.body);
    var donationResponse = DonationFormRes.fromJson(result);
    return donationResponse;
  }

  var dropDownValue;
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
                            child: widget.imagePath == null ||
                                    widget.imagePath!.isEmpty
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
                        "City*",
                        style: theme.textTheme.labelMedium,
                      ),
                      TextF(
                        hint: "Enter your city",
                        astrik: false,
                        textEditingController: locationControl,
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
                        textEditingController: locationDetailsControl,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Choose charity *",
                        style: theme.textTheme.labelMedium,
                      ),
                      FutureBuilder(
                          future: Api_Manager.getCharities(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.grey,
                              ));
                            }
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            }
                            CharitiesResponse? response = snapshot.data;
                            return DropdownButton(
                              style: theme.textTheme.labelSmall,
                              hint: const Text("Charities"),
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.02),
                              isExpanded: true,
                              value: dropDownValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: response?.data?.map((e) {
                                return DropdownMenuItem(
                                  value: e.id,
                                  child: Text(e.name ?? ""),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                              },
                            );
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
                    num? id = dropDownValue;
                    if (id != null) {
                      donate(
                        descriptionControl.text,
                        titleControl.text,
                        locationControl.text,
                        imagePath,
                        locationDetailsControl.text,
                        id,
                      ).then((response) {
                        print('Item sold successfully: ${response.toString()}');
                      }).catchError((error) {
                        print('Failed to sell item: $error');
                      });
                    } else {
                      print('Invalid price input');
                    }
                    _showDialog(context);
                  },
                  child: Buttons(title: "Submit", padd: 17))
            ],
          ),
        ));
  }
}

void _showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Thank you for donating!",
            style: TextStyle(fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          content: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, UsedView.routeName);
            },
            child: const Text(
              "See also",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        );
      });
}
