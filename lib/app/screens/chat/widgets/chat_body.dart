import 'package:firebase_chat/app/screens/chat/chat_cubit.dart';
import 'package:firebase_chat/app/screens/chat/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (_, __) => null,
      builder: (context, state){
        if (state is ChatInitialState) {
          return Center(child: Text('Load some messages!'));
        } else if (state is ChatMessagesLoading) {
          return Center(child: CircularProgressIndicator(),);
        } else if (state is ChatMessagesLoaded) {
          return Container(
            padding: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) => Text(state.messages[index]),
              )
          );
        }
        return null;
      }
    );
  }
}
