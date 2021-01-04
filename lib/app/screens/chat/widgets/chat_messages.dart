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
          orElse: () => null
        );
      },
    );
  }

  Widget _buildChatMessages(BuildContext context, List<dynamic> messages) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return Text(messages[index]);
      },
    );
  }
}
