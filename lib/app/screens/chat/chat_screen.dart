import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/app/screens/chat/widgets/chat_body.dart';
import 'package:firebase_chat/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_cubit.dart';
import 'chat_state.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Chat'),
          ),
          body: ChatBody(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.bloc<ChatCubit>().getText();
            },
          ),
        ),
      ),
    );
  }
}
