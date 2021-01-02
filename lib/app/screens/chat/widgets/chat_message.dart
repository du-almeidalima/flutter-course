import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;

  const ChatMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.message),
    );
  }
}
