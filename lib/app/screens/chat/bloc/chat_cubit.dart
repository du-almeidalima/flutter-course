import 'package:firebase_chat/app/screens/chat/bloc/chat_state.dart';
import 'package:firebase_chat/domain/chat/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChatCubit extends Cubit<ChatState> {
  final IChatRepository _chatRepository;

  ChatCubit(this._chatRepository) : super(const ChatState.initial());

  Future<void> getText() async {
    emit(const ChatState.loading());
    _chatRepository.getText().listen((messages) {
      emit(ChatState.loaded(
        messages.documents
            .map((document) => document['text'] as String)
            .toList(),
      ));
    });
  }
}
