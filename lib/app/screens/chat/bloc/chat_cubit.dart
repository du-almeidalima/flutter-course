
import 'package:firebase_chat/domain/chat/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import './chat_state.dart';

@singleton
class ChatCubit extends Cubit<ChatState> {
  final IChatRepository _chatRepository;

  ChatCubit(this._chatRepository) : super(const ChatState.initial());

  Future<void> getText() async {
    emit(const ChatState.loading());
    final chatStream = await _chatRepository.getText();
    chatStream.listen((messages) {
      emit(ChatState.loaded(messages));
    });
  }

  Future<void> sendMessage(String message) async {
    this._chatRepository.sendTextMessage(message);
  }
}
