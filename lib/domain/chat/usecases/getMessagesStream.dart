import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/domain/chat/repositories/chat_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMessagesStream {
  final IChatRepository _chatRepository;

  GetMessagesStream(this._chatRepository);

  Stream<QuerySnapshot> call() {
    return this._chatRepository.getText();
  }
}