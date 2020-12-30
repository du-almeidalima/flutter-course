import 'package:firebase_chat/app/screens/chat/chat_state.dart';
import 'package:firebase_chat/domain/chat/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final IChatRepository _chatRepository;

  ChatCubit(this._chatRepository) : super(ChatInitialState());

  Future<void> getText() async {
    emit(ChatMessagesLoading());
    _chatRepository.getText().listen((messages) {
      emit(ChatMessagesLoaded(
        messages.documents
            .map((document) => document['text'] as String)
            .toList(),
      ));
    });
  }
}
