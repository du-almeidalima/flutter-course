import 'package:firebase_chat/app/screens/chat/bloc/chat_cubit.dart';
import 'package:firebase_chat/app/screens/chat/bloc/chat_state.dart';
import 'package:firebase_chat/app/screens/chat/widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
        listener: (_, __) => null,
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text('No messages yet')),
            loading: () =>
                Center(
                    child: CircularProgressIndicator()
                ),
            loaded: (messages) => this._buildChatBody(context, messages),
            error: (failure) => Center(child: Text('An error has occurred!')),
          );
        });
  }

  Widget _buildChatBody(BuildContext context, List<dynamic> messages) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) =>
            ChatMessage(
              message: messages[index],
            ),
      ),
    );
  }
}
