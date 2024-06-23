import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/network_layer/api_manager.dart';
import 'package:graduation/models/get_user/Data.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/shared_preference.dart';
import '../../login/buttons.dart';
import '../../login/text_ff.dart';
import 'package:http/http.dart' as http;

class EditAccount extends StatefulWidget {
  static const String routeName = "EditAccount";
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController nameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  String? errorMessage;

  var formKey = GlobalKey<FormState>();
  UserData user = UserData();
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    user = UserData();
    futureData();
  }

  Future<void> futureData() async {
    await user.getUser();
    setState(() {
      nameControl.text = user.user?.name ?? '';
      emailControl.text = user.user?.email ?? '';
    });
  }

  Future<void> updateProfileAndPic() async {
    bool profileUpdated = false;
    bool picUpdated = false;

    if (formKey.currentState!.validate()) {
      await editProfile();
      profileUpdated = true;
    }

    if (selectedImage != null) {
      await uploadPic();
      picUpdated = true;
    }

    if (profileUpdated && picUpdated) {
      _showDialog(context, "Profile and picture updated successfully!");
    } else if (profileUpdated) {
      _showDialog(context, "Profile updated successfully!");
    } else if (picUpdated) {
      _showDialog(context, "Profile picture updated successfully!");
    }
  }

  Future<void> uploadPic() async {
    String? token = await Preference.getToken();
    final image = selectedImage?.path;

    var uri = Uri.parse("http://www.secondspin.xyz/api/userprofiles/uploadimage");

    var request = http.MultipartRequest('POST', uri)
      ..headers[HttpHeaders.authorizationHeader] = "Bearer $token"
      ..fields['image'] = image!;

    if (selectedImage != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image', selectedImage!.path));
    }

    try {
      var response = await request.send();

      if (response.statusCode == 201) {
        print("Success");
      } else {
        print('Failed to update image: ${response.statusCode}');
        var responseData = await response.stream.bytesToString();
        print('Error response: $responseData');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<void> editProfile() async {
    String? token = await Preference.getToken();
    final name = nameControl.text;
    final email = emailControl.text;
    final password = passControl.text;

    var uri = Uri.parse("http://www.secondspin.xyz/api/userprofiles/editprofile");

    var request = http.MultipartRequest('POST', uri)
      ..headers[HttpHeaders.authorizationHeader] = "Bearer $token"
      ..fields['name'] = name
      ..fields['email'] = email
      ..fields['password'] = password;

    try {
      var response = await request.send();

      if (response.statusCode == 201) {
        print("Success");
      } else if (response.statusCode == 401 || response.statusCode == 302) {
        setState(() {
          errorMessage = "Invalid credentials";
        });
        return Future.error("Invalid credentials");
      }else {
        print('Failed to edit profile: ${response.statusCode}');
        var responseData = await response.stream.bytesToString();
        print('Error response: $responseData');
      }
    } catch (e) {
      print('Error: $e');
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
                              child:
                              selectedImage == null && user.user?.image == null
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
                              onPressed: () {
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
                                if (errorMessage != null) {
                                  return errorMessage;
                                }
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
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              MaterialButton(
                  onPressed: () {
    if (formKey.currentState!.validate()) {
      setState(() {
        errorMessage = null;
      });
      updateProfileAndPic();
    }
                  },
                  child: Buttons(title: "Save changes", padd: 18))
            ],
          ),
        ),
      ),
    );
  }

  Future pickImageFromGallery() async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic == null) return;
    setState(() {
      selectedImage = File(pic.path);
    });
  }
}

void _showDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.w900),
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

