import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/widgets/chat/chatinput.dart';
import 'package:get_spot/widgets/chat/dialerbutton.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];

  void _onSendPressed(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.insert(0, {'type': 'text', 'content': text});
      });
    }
  }

  void _onFileSelected(File file) {
    setState(() {
      _messages.insert(0, {'type': 'file', 'content': file});
    });
  }

  void _onImageCaptured(File image) {
    setState(() {
      _messages.insert(0, {'type': 'image', 'content': image});
    });
  }

  void _showFilePreview(File file) {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: file.path.endsWith('.mp4')
                  ? Center(
                      child: Text(
                        "Video Preview Not Supported",
                        style: TextStyle(color: Colors.white),
                      ),
                    ) // Placeholder for video handling
                  : Image.file(file, fit: BoxFit.contain),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.White,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.Black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(backgroundImage: AssetImage(PROFILEIMG)),
            const SizedBox(width: 10),
            Text('Avinash', style: TextStyle(color: AppColor.Black)),
          ],
        ),
        actions: [
          DialerButton(phoneNumber: '+91 9700020630'),
          IconButton(icon: Image.asset(VIDEO), onPressed: () {}),
          IconButton(icon: Image.asset(DOTS), onPressed: () {}),
        ],
      ),
      backgroundColor: AppColor.White,
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Text(
                      'No messages yet',
                      style: TextStyle(color: AppColor.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      if (message['type'] == 'text') {
                        return _buildTextMessage(message['content']);
                      } else if (message['type'] == 'image' || message['type'] == 'file') {
                        return _buildFileMessage(message['content']);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: ChatInput(
              onSendPressed: _onSendPressed,
              onImageCaptured: _onImageCaptured,
              onFileSelected: _onFileSelected,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextMessage(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            color: AppColor.PrimaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          constraints: const BoxConstraints(maxWidth: 300),
          child: Text(text, style: TextStyle(color: AppColor.Black), maxLines: null),
        ),
      ),
    );
  }
  //

  Widget _buildFileMessage(File file) {
    return GestureDetector(
      onTap: () => _showFilePreview(file),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(4.0),
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: AppColor.PrimaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: file.path.endsWith('.mp4')
                ? Icon(Icons.video_file, size: 50, color: Colors.white) // Placeholder for videos
                : Image.file(file, height: 150, width: 150, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

