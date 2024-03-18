import 'package:chatbot/config/palette.dart';
import 'package:chatbot/widgets/chat_widget.dart';
import 'package:chatbot/widgets/new_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Palette.primary,
        title: Row(
          children: [
            SizedBox(width: screenWidth * 0.03),
            const Text(
              'Chatbot',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Default',
              ),
            ),
          ],
        ),
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: const Column(
        children: [
          Expanded(child: ChatWidget()),
          NewMessage(),
        ],
      ),
    );
  }
}
