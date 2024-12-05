import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/widgets/chat/dialpad.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = [];

  void _onSendPressed(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.insert(0, text);
      });
    }
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
            CircleAvatar(backgroundImage: AssetImage(PROFILEIMG)),
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
                ? Center(child: Text('No messages yet', style: TextStyle(color: AppColor.grey, fontSize: 16)))
                : ListView.builder(
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
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
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Text(_messages[index], style: TextStyle(color: AppColor.Black), maxLines: null),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: ChatInput(onSendPressed: _onSendPressed),
          ),
        ],
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  final void Function(String) onSendPressed;

  const ChatInput({Key? key, required this.onSendPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

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
                    controller: _controller,
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
                    IconButton(icon: Image.asset(CAMERA), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: Image.asset(SEND, height: 40, width: 40),
          onPressed: () {
            onSendPressed(_controller.text);
            _controller.clear();
          },
        ),
      ],
    );
  }
}
