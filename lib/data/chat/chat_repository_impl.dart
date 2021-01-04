import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/domain/chat/chat_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IChatRepository)
class ChatRepositoryImpl implements IChatRepository {
  final Firestore _firestore;

  ChatRepositoryImpl(this._firestore);

  @override
  Stream<QuerySnapshot> getText() {
    return this
        ._firestore
        .collection('chat')
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots();
  }

  @override
  Future<void> sendTextMessage(String message) async {
    return await this._firestore.collection('chat').add({
      'text': message,
      'createdAt': Timestamp.now(),
    });
  }
}
