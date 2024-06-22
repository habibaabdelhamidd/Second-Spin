import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/shared_preference.dart';
import 'package:http/http.dart' as http;
import '../../../models/category_list/CategoryList.dart';
import '../../category/used/used_view.dart';

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
  TextEditingController locDetailsControl = TextEditingController();
  TextEditingController priceControl = TextEditingController();

  CategorySelected cat = CategorySelected();
  File? selectedImage;
  var dropDownValue;

  @override
  void initState() {
    super.initState();
    cat = CategorySelected();
    futureData();
  }

  Future<void> futureData() async {
    await cat.getCat();
    setState(() {});
  }

  Future sell(int? catId) async {
    String? token = await Preference.getToken();
    final description = descriptionControl.text;
    final title = titleControl.text;
    final location = locationControl.text;
    final locationDetails = locDetailsControl.text;
    final price = priceControl.text;

    var uri = Uri.parse("http://www.secondspin.xyz/api/products/store/$catId");

    var request = http.MultipartRequest('POST', uri)
      ..headers[HttpHeaders.authorizationHeader] = "Bearer $token"
      ..fields['description'] = description
      ..fields['title'] = title
      ..fields['location'] = location
      ..fields['location_details'] = locationDetails
      ..fields['price'] = price;

    if (selectedImage != null) {
      request.files.add(await http.MultipartFile.fromPath('image', selectedImage!.path));
    }

    try {
      var response = await request.send();

      if (response.statusCode == 201) {
        print("Success");
        // Optionally, you can parse and return the response body here
      } else {
        print('Failed to sell item: ${response.statusCode}');
        var responseData = await response.stream.bytesToString();
        print('Error response: $responseData');
      }
    } catch (e) {
      print('Error: $e'); // Print any error that occurs
      rethrow;
    }
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
                    MaterialButton(
                      onPressed: pickImageFromCamera,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: selectedImage == null
                            ? Column(
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
                              style: theme.textTheme.labelMedium?.copyWith(color: theme.primaryColor),
                            ),
                            Text(
                              "Take a photo of your item",
                              style: theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
                            )
                          ],
                        )
                            : Image.file(
                          selectedImage!,
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
                      asterisk: false,
                      textEditingController: titleControl,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      "Choose item category *",
                      style: theme.textTheme.labelMedium,
                    ),
                    DropdownButton(
                      style: theme.textTheme.labelSmall,
                      hint: const Text("Categories"),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                      isExpanded: true,
                      value: dropDownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cat.user?.data?.map((e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(e.name ?? ""),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropDownValue = newValue;
                        });
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
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
                      "Region *",
                      style: theme.textTheme.labelMedium,
                    ),
                    TextF(
                      hint: "Enter your location details",
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
                      asterisk: false,
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
                sell(dropDownValue).then((response) {
                  print('Item sold successfully: ${response.toString()}');
                }).catchError((error) {
                  print('Failed to sell item: $error');
                });
                _showDialog(context);
              },
              child: Buttons(title: "Submit", padd: 17),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImageFromCamera() async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic == null) return;
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
            "Form submitted!",
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

class CategorySelected {
  CategoryList? user;
  Api_Manager apiManager = Api_Manager();
  Future<void> getCat() async {
    user = (await apiManager.listCategories());
  }
}
