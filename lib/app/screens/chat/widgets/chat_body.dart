import 'package:firebase_chat/app/screens/chat/widgets/chat_input.dart';
import 'package:firebase_chat/app/screens/chat/widgets/chat_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(child: ChatMessages()),
          ChatInput(),
        ],
      ),
    );
  }
}
