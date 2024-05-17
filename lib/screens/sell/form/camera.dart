import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/sell/form/sell_form.dart';

class FormCamera extends StatefulWidget {
  static const String routeName = "FormCamera";
  const FormCamera({super.key});

  @override
  State<FormCamera> createState() => _FormCameraState();
}

class _FormCameraState extends State<FormCamera> {
  late CameraController cameraController;
  late Future<void> initializeController;
  @override
  void initState() {
    cameraController = CameraController(
        const CameraDescription(
            name: "name",
            lensDirection: CameraLensDirection.front,
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
                  builder: (context) => SellForm(
                        imagePath: image.path,
                      )));
            } catch (e) {}
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
}
