import 'package:firebase_chat/data/chat/entity/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_cubit.dart';
import '../bloc/chat_state.dart';

class ChatMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (_, __) => null,
      builder: (context, state) {
        return state.maybeWhen(
            initial: () => Center(child: Text('No messages yet')),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (messages) => this._buildChatMessages(context, messages),
            error: (failure) => Center(child: Text('An error has occurred!')),
            orElse: () => null);
      },
    );
  }

  Widget _buildChatMessages(BuildContext context, List<dynamic> messages) {
    return ListView.builder(
      reverse: true,

      itemCount: messages.length,
      itemBuilder: (context, index) {
        return _MessageBubble(
          chatMessage: ChatMessage(
            messages[index],
          ),
        );
      },
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final ChatMessage chatMessage;

  const _MessageBubble({Key key, this.chatMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 100,
            maxWidth: 250,
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).primaryColorLight,
            ),
            child: Text(
              chatMessage.content,
              style: TextStyle(
                color: Theme.of(context).primaryTextTheme.bodyText1.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
