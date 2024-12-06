import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/widgets/chat/camerabutton.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatInput extends StatelessWidget {
  final void Function(String) onSendPressed;
  final void Function(File) onImageCaptured;
  final void Function(File) onFileSelected;

  const ChatInput({
    super.key,
    required this.onSendPressed,
    required this.onImageCaptured,
    required this.onFileSelected,
  });

  Future<void> _showAttachOptions(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.image, color: Colors.blue),
              title: Text('Photos & Video'),
              onTap: () async {
                Navigator.pop(context); // Close the bottom sheet
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  onImageCaptured(File(pickedFile.path));
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_drive_file, color: Colors.green),
              title: Text('File'),
              onTap: () async {
                Navigator.pop(context); // Close the bottom sheet
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt'],
                );
                if (result != null && result.files.single.path != null) {
                  File file = File(result.files.single.path!);
                  // Handle the file here, e.g., display or upload it
                  print('Picked file: ${file.path}');
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, right: 4.0),
            decoration: BoxDecoration(
              color: AppColor.White2,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: AppColor.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(ATTACH),
                      onPressed: () => _showAttachOptions(context),
                    ),
                    CameraButton(onImageCaptured: onImageCaptured),
                  ],
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: Image.asset(SEND, height: 40, width: 40),
          onPressed: () {
            onSendPressed(controller.text);
            controller.clear();
          },
        ),
      ],
    );
  }
}
