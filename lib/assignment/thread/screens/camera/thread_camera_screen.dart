import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../constants/sizes.dart';

class ThreadCameraScreen extends StatefulWidget {
  const ThreadCameraScreen({super.key});

  @override
  State<ThreadCameraScreen> createState() => _ThreadCameraScreenState();
}

class _ThreadCameraScreenState extends State<ThreadCameraScreen> {
  late final CameraController _cameraController;

  bool _hasPermission = false;

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied = cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied = micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.ultraHigh,
    );

    await _cameraController.initialize();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _onCaptureCameraPressed() async {
    final picture = await _cameraController.takePicture();
    print("_onCaptureCameraPressed picture: $picture");
    Navigator.pop(context, picture);
  }

  Future<void> _onPickImagePressed() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture == null) return;
    print("_onPickImagePressed picture: $picture");
    Navigator.pop(context, picture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _hasPermission && _cameraController.value.isInitialized
          ? Stack(
              alignment: Alignment.center,
              children: [
                CameraPreview(_cameraController),
                Positioned(
                  bottom: Sizes.size40,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: _onCaptureCameraPressed,
                        child: Container(
                          width: Sizes.size80,
                          height: Sizes.size80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: _onPickImagePressed,
                            icon: const FaIcon(
                              FontAwesomeIcons.image,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
