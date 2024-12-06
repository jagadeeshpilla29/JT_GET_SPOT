import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraButton extends StatefulWidget {
  final void Function(File image) onImageCaptured;

  const CameraButton({Key? key, required this.onImageCaptured}) : super(key: key);

  @override
  _CameraButtonState createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  Future<void> _openCamera() async {
    final ImagePicker picker = ImagePicker();
    try {
      // Capture image from the camera
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        widget.onImageCaptured(File(image.path));
      }
    } catch (e) {
      print("Error opening camera: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(CAMERA),
      onPressed: _openCamera,
    );
  }
}


