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
      } else if (response.statusCode == 302 || response.statusCode == 500) {
        setState(() {
          errorMessage = "Invalid credentials";
        });
        return Future.error("Invalid credentials");
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
  var formKey = GlobalKey<FormState>();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Scaffold(
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
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter a title to your product";
                          }
                          return null;
                        },
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
                        hint: "Describe your product?",
                        asterisk: false,
                        textEditingController: descriptionControl,
                        validator: (String? value) {
                          if (value!.length < 10) {
                            return "Please write full description";
                          }
                          if (value.trim().isEmpty) {
                            return "Please enter description";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Region *",
                        style: theme.textTheme.labelMedium,
                      ),
                      TextF(
                        hint: "cairo",
                        asterisk: false,
                        textEditingController: locationControl,
                        validator: (String? value) {
                          if (errorMessage != null ) {
                            return "Please enter a city";
                          }
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your city";
                          }
                          return null;
                        },
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
                        validator: (String? value) {
                          if (value!.length < 10) {
                            return "Please write full location details";
                          }
                          if (value.trim().isEmpty) {
                            return "Please enter location details";
                          }
                          return null;
                        },
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
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty || value == '0' ) {
                            return "Please put a price to your item";
                          }
                          return null;
                        },
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
                  if (formKey.currentState!.validate()) {}
                  sell(dropDownValue).then((response) {
                    print('Item sold successfully: ${response.toString()}');
                  }).catchError((error) {
                    print('Failed to sell item: $error');
                  });
                  if (formKey.currentState!.validate()) {_showDialog(context);}
                },
                child: Buttons(title: "Submit", padd: 17),
              ),
            ],
          ),
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
