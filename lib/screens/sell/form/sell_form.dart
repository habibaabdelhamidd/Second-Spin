import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import 'package:graduation/models/sell_res/SellResponse.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
import '../../../core/shared_preference.dart';
import 'package:http/http.dart' as http;
import '../../../models/category_list/CategoryList.dart';
import 'camera.dart';

class SellForm extends StatefulWidget {
  static const String routeName = "SellForm";
  final String? imagePath;

  const SellForm({
    super.key,
    this.imagePath,
  });

  @override
  State<SellForm> createState() => _SellFormState();
}

class _SellFormState extends State<SellForm> {
  TextEditingController titleControl = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();
  TextEditingController locationControl = TextEditingController();
  TextEditingController storyControl = TextEditingController();
  TextEditingController priceControl = TextEditingController();
  TextEditingController locDetailsControl = TextEditingController();

  Future<SellResponse> sell(
    String? description,
    String? title,
    String? location,
    String? imagePath,
    dynamic story,
    num? price,
    String? locDetails,
  ) async {
    String? token = await Preference.getToken();
    final body = jsonEncode(<String, dynamic>{
      "description": description,
      "title": title,
      "location": location,
      "image": imagePath,
      "story": story,
      "price": price,
      "location_details": locDetails,
    });

    print('Request Body: $body'); // Print request body for debugging

    try {
      var response = await http.post(
        Uri.parse("http://secondspin.xyz/api/products/store"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: body,
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        final result = jsonDecode(response.body);
        return SellResponse.fromJson(result);
      } else {
        final result = jsonDecode(response.body);
        throw Exception('Failed to sell item: ${result['message']}');
      }
    } catch (e) {
      print('Error: $e'); // Print any error that occurs
      rethrow;
    }
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
                      onTap: () async {
                        Navigator.pushNamed(context, FormCamera.routeName);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
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
                              )
                            : Image.file(
                                File(widget.imagePath!),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
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
                      "Choose item category *",
                      style: theme.textTheme.labelMedium,
                    ),
                    // FutureBuilder(
                    //     future: Api_Manager.getAllCategory(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.connectionState ==
                    //           ConnectionState.waiting) {
                    //         return const Center(
                    //             child: CircularProgressIndicator(
                    //           color: Colors.grey,
                    //         ));
                    //       }
                    //       if (snapshot.hasError) {
                    //         return Text(snapshot.error.toString());
                    //       }
                    //       return DropdownButton(
                    //         style: theme.textTheme.labelSmall,
                    //         padding: EdgeInsets.all(
                    //             MediaQuery.of(context).size.width * 0.02),
                    //         isExpanded: true,
                    //         value: dropDownValue,
                    //         icon: const Icon(Icons.keyboard_arrow_down),
                    //         items: snapshot.data?.map((e) {
                    //           return DropdownMenuItem(
                    //             value: e.toString(),
                    //             child: Text(e.toString()),
                    //           );
                    //         }).toList(),
                    //         onChanged: (newValue) {
                    //           setState(() {
                    //             dropDownValue = newValue!;
                    //           });
                    //         },
                    //       );
                    //     }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
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
                      "Tell Us Your Story",
                      style: theme.textTheme.labelMedium,
                    ),
                    TextF(
                      hint: "Tell Us Your Story?",
                      astrik: false,
                      textEditingController: storyControl,
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
                      "Location details *",
                      style: theme.textTheme.labelMedium,
                    ),
                    TextF(
                      hint: "Enter your location details",
                      astrik: false,
                      textEditingController: locDetailsControl,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      "Price *",
                      style: theme.textTheme.labelMedium,
                    ),
                    TextF(
                      hint: "Enter item Price",
                      astrik: false,
                      textEditingController: priceControl,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MaterialButton(
              onPressed: () {
                final num? price = num.tryParse(priceControl.text);
                if (price != null) {
                  sell(
                    descriptionControl.text.toString(),
                    titleControl.text.toString(),
                    locationControl.text.toString(),
                    widget.imagePath,
                    storyControl.text.toString(),
                    price,
                    locDetailsControl.text.toString(),
                  ).then((response) {
                    // Handle the response
                    print('Item sold successfully: ${response.toString()}');
                  }).catchError((error) {
                    // Handle the error
                    print('Failed to sell item: $error');
                  });
                } else {
                  // Handle invalid price input
                  print('Invalid price input');
                }
              },
              child: Buttons(title: "Submit", padd: 17),
            ),
          ],
        ),
      ),
    );
  }
}
