import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/widgets/chat/dialerbutton.dart';
import 'package:get_spot/widgets/chat/camerabutton.dart';

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

  void _onImageCaptured(File image) {
    setState(() {
      _messages.insert(0, {'type': 'image', 'content': image});
    });
  }

  void _showImagePreview(File image) {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context), // Close the preview on tap
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.file(image, fit: BoxFit.contain),
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
                      } else if (message['type'] == 'image') {
                        return _buildImageMessage(message['content']);
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

  Widget _buildImageMessage(File image) {
    return GestureDetector(
      onTap: () => _showImagePreview(image),
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
            child: Image.file(image, height: 150, width: 150, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}



class ChatInput extends StatelessWidget {
  final void Function(String) onSendPressed;
  final void Function(File) onImageCaptured;

  const ChatInput({
    super.key,
    required this.onSendPressed,
    required this.onImageCaptured,
  });

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
                    IconButton(icon: Image.asset(ATTACH), onPressed: () {}),
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
