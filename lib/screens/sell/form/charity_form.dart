import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/network_layer/api_manager.dart';
import '../../../core/shared_preference.dart';
import '../../../models/Donation/DonationFormRes.dart';
import 'package:http/http.dart' as http;
import '../../../models/charities_response/CharityData.dart';
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
      num? charityId,
      String? description,
    String? title,
    String? location,
    String? locationDetails,
    String? imagePath,

  ) async {
    String? token = await Preference.getToken();
    final body = jsonEncode(<String, dynamic>{
      "description": description,
      "title": title,
      "location": location,
      "location_details": locationDetails,
      "image": imagePath,
    });
    print('Request Body: $body');
    var response = await http.post(
        Uri.parse("http://www.secondspin.xyz/api/donations/store/$charityId"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        );
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);
      print(response.body);
      var donationResponse = DonationFormRes.fromJson(result);
      return donationResponse;
    }  else {
      final result = jsonDecode(response.body);
      throw Exception('Failed to sell item: ${result['message']}');
    }
    // final result = jsonDecode(response.body);
    // print(response.body);
    // var donationResponse = DonationFormRes.fromJson(result);
    // return donationResponse;
  }
  CharitySelected charity = CharitySelected();
  @override
  void initState() {
    super.initState();
    charity = CharitySelected();
    futureData();
  }

  Future<void> futureData() async {
    await charity.getCat();
    setState(() {});
  }
  var dropDownValue;
  File? selectedImage;
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
                            pickImageFromCamera();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: selectedImage == null
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
                                : Image.file(selectedImage!,
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
                        asterisk: false,
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
                        asterisk: false,
                        textEditingController: descriptionControl,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Region*",
                        style: theme.textTheme.labelMedium,
                      ),
                      TextF(
                        hint: "Enter your city",
                        asterisk: false,
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
                        asterisk: false,
                        textEditingController: locationDetailsControl,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Choose charity *",
                        style: theme.textTheme.labelMedium,
                      ),
                      DropdownButton(
                              style: theme.textTheme.labelSmall,
                              hint: const Text("Charities"),
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.02),
                              isExpanded: true,
                              value: dropDownValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: charity.user?.data?.map((e) {
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
                            ),
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
                        // dropDownValue,
                        // descriptionControl.text,
                        // titleControl.text,
                        // locationControl.text,
                        // locationDetailsControl.text,
                        // selectedImage?.path.toString()
                        3,
                        "dcjhgbgtyhmjkjb",
                        "mcnnc",
                        "giza",
                        ",njbjhvhchc",
                        "assets/image/unknown_user.png"

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
  Future pickImageFromCamera() async {
    final pic =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if(pic == null)return;
    setState(() {
      selectedImage = File(pic.path);
    });
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
class CharitySelected {
  CharityData? user;
  Api_Manager apiManager = Api_Manager();
  Future<void> getCat() async {
    user = (await apiManager.getCharities());
  }
}
