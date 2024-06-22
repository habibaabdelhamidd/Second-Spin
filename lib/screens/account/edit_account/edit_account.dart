import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import 'package:graduation/models/get_user/Data.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/shared_preference.dart';
import '../../login/buttons.dart';
import '../../login/text_ff.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class EditAccount extends StatefulWidget {
  static const String routeName = "EditAccount";
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController nameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController numberControl = TextEditingController();
  TextEditingController passControl = TextEditingController();

  var formKey = GlobalKey<FormState>();
  UserData user = UserData();
  @override
  void initState() {
    super.initState();
    user = UserData();
    futureData();
  }

  Future<void> futureData() async {
    await user.getUser();
    setState(() {});
  }
File? selectedImage;
  Future editProfile() async {
    String? token = await Preference.getToken();
    final name = nameControl.text;
    final  email = emailControl.text;
    final password = passControl.text;

    var uri = Uri.parse("http://www.secondspin.xyz/api/userprofiles/editprofile");

    var request = http.MultipartRequest('POST', uri)
      ..headers[HttpHeaders.authorizationHeader] = "Bearer $token"
      ..fields['name'] = name
      ..fields['email'] = email
      ..fields['password'] = password;

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
          iconTheme: theme.appBarTheme.iconTheme,
          title: Text(
            "Edit profile",
            style: theme.appBarTheme.titleTextStyle,
          )),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            backgroundImage: selectedImage != null
                                ? FileImage(selectedImage!)
                                : user.user?.image != null
                                ? NetworkImage(user.user!.image!)
                                : null,
                          child: selectedImage == null && user.user?.image == null
                              ? const Icon(
                            Icons.person_outline,
                            size: 60,
                          )
                              : null,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        MaterialButton(
                          onPressed: (){
                            pickImageFromGallery();
                          },
                          child: Text(
                            "Change profile picture",
                            style: theme.textTheme.bodyLarge!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name",
                          style: theme.textTheme.labelLarge
                              ?.copyWith(color: const Color(0xf72B3139)),
                        ),
                        TextF(
                          hint: user.user?.name ?? "",
                          asterisk: false,
                          textEditingController: nameControl,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          "Email",
                          style: theme.textTheme.labelLarge
                              ?.copyWith(color: const Color(0xf72B3139)),
                        ),
                        TextF(
                          hint: user.user?.email ?? "",
                          asterisk: false,
                          textEditingController: emailControl,
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your E-mail address";
                            }
                            var regex = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (!regex.hasMatch(value)) {
                              return "Invalid E-mail address";
                            }
                            return null;
                          },
                          // onSaved: (mail) {
                          //   mail = emailControl.text;
                          // },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          "Phone Number",
                          style: theme.textTheme.labelLarge
                              ?.copyWith(color: const Color(0xf72B3139)),
                        ),
                        TextF(
                          hint: "(209) 555-0104",
                          asterisk: false,
                          textEditingController: numberControl,
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter phone number";
                            }
                            if (value.length != 11) {
                              return "Invalid phone number";
                            }

                            return null;
                          },
                          // onSaved: (String? pass) {
                          //   pass = passControl.text;
                          // }
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          "Password",
                          style: theme.textTheme.labelLarge
                              ?.copyWith(color: const Color(0xf72B3139)),
                        ),
                        TextF(
                          hint: "*******",
                          asterisk: false,
                          textEditingController: passControl,
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter password";
                            }
                            var regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                            if (!regex.hasMatch(value)) {
                              return "Invalid Password";
                            }
                            return null;
                          },
                          // onSaved: (String? pass) {
                          //   pass = passControl.text;
                          // }
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    MaterialButton(
                        onPressed: () {
                          validate();
                          editProfile();
                          _showDialog(context);
                        },
                        child: Buttons(title: "Save changes", padd: 18))
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validate() {
    if (formKey.currentState!.validate()) {
      // Navigator.pushNamed(context, HomeLayout.routeName);
    }
  }

  Future pickImageFromGallery() async {
    final pic =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pic == null)return;
    setState(() {
      selectedImage = File(pic.path);
    });
  }
  Future<void> saveImage (File image) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final String fileName = path.basename(image.path);
      final String newPath = path.join(directory.path, fileName);
      final savedImage = await image.copy(newPath);

      setState(() {
        selectedImage = savedImage;
      });

      print('Image saved to $newPath');
    } catch (e) {
      print('Error saving image: $e');
    }
  }
}
void _showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text(
            "Profile edited successfully!",
            style: TextStyle(fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
        );
      });
}

class UserData {
  GetUserData? user;
  Api_Manager apiManager = Api_Manager();
  Future<void> getUser() async {
    user = (await apiManager.userData());
  }
}
