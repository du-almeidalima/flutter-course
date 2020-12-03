import 'package:firebase_chat/app/screens/chat/chat_state.dart';
import 'package:firebase_chat/domain/chat/usecases/getMessagesStream.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final GetMessagesStream _getMessagesStream;

  ChatCubit(this._getMessagesStream) : super(ChatInitialState());

  Future<void> getText() async {
    emit(ChatMessagesLoading());
    _getMessagesStream().listen((messages) {
      emit(ChatMessagesLoaded(
        messages.documents
            .map((document) => document['text'] as String)
            .toList(),
      ));
    });
  }
}
