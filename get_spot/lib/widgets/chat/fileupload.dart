import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileUploadWidget extends StatefulWidget {
  final Function(File) onFileSelected;

  const FileUploadWidget({Key? key, required this.onFileSelected}) : super(key: key);

  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mov'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });

      // Pass the selected file back to the parent widget
      widget.onFileSelected(_selectedFile!);
    }
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
      });

      // Pass the selected file back to the parent widget
      widget.onFileSelected(_selectedFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: Icon(Icons.attach_file),
              label: Text('Pick File'),
            ),
            ElevatedButton.icon(
              onPressed: _pickImageFromGallery,
              icon: Icon(Icons.photo),
              label: Text('Pick Photo'),
            ),
          ],
        ),
        if (_selectedFile != null)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: _selectedFile!.path.endsWith('.mp4') || _selectedFile!.path.endsWith('.mov')
                ? Text(
                    'Selected Video: ${_selectedFile!.path.split('/').last}',
                    style: TextStyle(fontSize: 16),
                  )
                : Image.file(
                    _selectedFile!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
          ),
      ],
    );
  }
}
