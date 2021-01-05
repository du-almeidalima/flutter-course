import 'dart:async';

import 'package:firebase_chat/domain/chat/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import './chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final IChatRepository _chatRepository;
  StreamSubscription<dynamic> _chatStreamSub;

  ChatCubit(this._chatRepository) : super(const ChatState.initial());

  Future<void> getChatMessages() async {
    emit(const ChatState.loading());
    final chatStream = await _chatRepository.getText();
    chatStream.fold(
      (failure) {
        emit(ChatState.error(failure));
      },
      (chatStream) {
        this._chatStreamSub = chatStream.listen((messages) {
          emit(ChatState.loaded(messages));
        });
      },
    );
  }

  Future<void> sendMessage(String message) async {
    await this._chatRepository.sendTextMessage(message);
  }

  @override
  Future<void> close() async {
    await this._chatStreamSub.cancel();
    return super.close();
  }
}
