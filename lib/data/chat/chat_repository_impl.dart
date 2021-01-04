import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/domain/chat/chat_repository.dart';
import 'package:injectable/injectable.dart';

import 'entity/ChatMessage.dart';

@Injectable(as: IChatRepository)
class ChatRepositoryImpl implements IChatRepository {
  final Firestore _firestore;

  ChatRepositoryImpl(this._firestore);

  @override
  Future<Stream<List<ChatMessage>>> getText() async {
    final user = await FirebaseAuth.instance.currentUser();

    return this
        ._firestore
        .collection('chat')
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots()
        .map(
          (event) => event.documents
              .map(
                (item) => ChatMessage(
                  content: item['text'],
                  isMe: item.data['userId'] == user.uid,
                  id: item.documentID
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> sendTextMessage(String message) async {
    final user = await FirebaseAuth.instance.currentUser();
    return await this._firestore.collection('chat').add({
      'text': message,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
    });
  }
}
