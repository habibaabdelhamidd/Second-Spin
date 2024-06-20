import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/sell/form/charity_form.dart';

class CharityCamera extends StatefulWidget {
  static const String routeName = "CharityCamera";
  const CharityCamera({super.key});

  @override
  State<CharityCamera> createState() => _CharityCameraState();
}

class _CharityCameraState extends State<CharityCamera> {
  late CameraController cameraController;
  late Future<void> initializeController;
  @override
  void initState() {
    cameraController = CameraController(
        const CameraDescription(
            name: "name",
            lensDirection: CameraLensDirection.back,
            sensorOrientation: 1),
        ResolutionPreset.medium);
    initializeController = cameraController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        FutureBuilder<void>(
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(cameraController);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          future: initializeController,
        ),
        FloatingActionButton(
          onPressed: () async {
            try {
              final image = await cameraController.takePicture();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CharityForm(imagePath: image.path,
                  )));
              // Navigator.popAndPushNamed(context, CharityForm.routeName,
              //     arguments: image.path);
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => CharityForm(
              //               imagePath: image.path,
              //             )));
              // Navigator.pop(context, image.path);
            } catch (e) {
              rethrow;
            }
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.camera_alt,
            color: theme.primaryColor,
          ),
        )
      ],
    );
  }
  // void navigate(Widget navigateTo){
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => navigateTo));
  // }
}
