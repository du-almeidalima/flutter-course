import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_cubit.dart';

class ChatInput extends StatefulWidget {
  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _messageController = TextEditingController();
  String _message = '';

  void _sendMessage() async {
    await this.context.read<ChatCubit>().sendMessage(this._message.trim());
    this._messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: this._messageController,
              decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              onChanged: (value) {
                setState(() {
                  this._message = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: this._message.trim().isEmpty ? null : this._sendMessage,
          )
        ],
      ),
    );
  }
}
