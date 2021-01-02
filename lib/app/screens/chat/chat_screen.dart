import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/app/screens/chat/widgets/chat_body.dart';
import 'package:firebase_chat/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_cubit.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Chat'),
            actions: [this._buildDropdownButton(context)],
          ),
          body: ChatBody(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.read<ChatCubit>().getText();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButton(BuildContext context) {
    return DropdownButton(
      icon: Icon(
        Icons.more_vert,
        color: Theme.of(context).primaryIconTheme.color,
      ),
      items: [
        DropdownMenuItem(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.exit_to_app),
                const Text('Logout')
              ],
            ),
          ),
          value: 'logout',
        ),
      ],
      onChanged: (itemIdentifier) {
        if (itemIdentifier == 'logout') {
          FirebaseAuth.instance.signOut();
        }
      },
    );
  }
}
