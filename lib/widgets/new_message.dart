import 'package:chatbot/config/palette.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _controller = TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() {
    FocusScope.of(context).unfocus();
    _controller.clear();
    setState(() {
      _enteredMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '챗봇과 대화해보세요',
                hintStyle: TextStyle(
                  fontFamily: 'Default',
                  color: Colors.black54,
                  fontSize: screenHeight * 0.022,
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: ClipOval(
              child: Material(
                color: Palette.primary, // 버튼 색상
                child: InkWell(
                  splashColor: Palette.secondary,
                  onTap: _enteredMessage.trim().isEmpty
                      ? null
                      : _sendMessage, // 눌렀을 때, 물방울 효과 색상
                  child: SizedBox(
                    width: screenHeight * 0.05,
                    height: screenHeight * 0.05,
                    child: Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                      size: screenHeight * 0.03,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
