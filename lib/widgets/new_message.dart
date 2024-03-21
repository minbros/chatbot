import 'package:chatbot/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _controller = TextEditingController();
  var _enteredMessage = '';
  bool _isMessageEntered = false;

  void _sendMessage() {
    FocusScope.of(context).unfocus();
    _controller.clear();
    setState(() {
      _enteredMessage = '';
      _isMessageEntered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(screenWidth * 0.02),
            decoration: BoxDecoration(
                color: Palette.newMessage,
                borderRadius: BorderRadius.circular(30)),
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
                    minLines: 1,
                    maxLines: 6,
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
                        _isMessageEntered = value.isNotEmpty;
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    _isMessageEntered ? null : Icons.mic,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            screenWidth * 0.02,
            screenWidth * 0.02,
            screenWidth * 0.02,
          ),
          child: Column(
            children: [
              ClipOval(
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
            ],
          ),
        ),
      ],
    );
  }
}
