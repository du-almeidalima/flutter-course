import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_chat/domain/auth/auth_repository.dart';
import 'package:firebase_chat/domain/auth/exceptions/unauthenticated_user_exception.dart';
import 'package:firebase_chat/domain/chat/chat_repository.dart';
import 'package:firebase_chat/domain/core/error.dart';
import 'package:firebase_chat/domain/core/severity_enum.dart';
import 'package:injectable/injectable.dart';

import '../../domain/chat/entities/chat_message.dart';

@Injectable(as: IChatRepository)
class ChatRepositoryImpl implements IChatRepository {
  final Firestore _firestore;
  final IAuthRepository _authRepository;

  ChatRepositoryImpl(this._firestore, this._authRepository);

  /// This method needed to be Async in order to get User Details and it also
  /// needs to treat errors, from both Firebase and Authentication, therefore
  /// the Either
  @override
  Future<Either<Failure, Stream<List<ChatMessage>>>> getText() async {
    try {
      final user = await this._authRepository.getCurrentUser();
      final chatStream = this
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
                    username: item['username'],
                    isMe: item.data['userId'] == user.uid,
                    id: item.documentID,
                  ),
                )
                .toList(),
          );
      return right(chatStream);
    } on UnauthenticatedUserException catch (e) {
      return left(Failure(
        code: e.code,
        severityEnum: SeverityEnum.ALERT,
      ));
    } catch (e) {
      return left(Failure(
        code: 'UNKNOWN_ERROR',
        severityEnum: SeverityEnum.DANGER,
      ));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendTextMessage(String message) async {
    try {
      final user = await this._authRepository.getCurrentUser();

      await this._firestore.collection('chat').add({
        'text': message,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'username': user.username,
      });

      return right(unit);
    } on UnauthenticatedUserException catch (e) {
      return left(Failure(
        code: e.code,
        severityEnum: SeverityEnum.ALERT,
      ));
    } catch (e) {
      return left(Failure(
        code: 'UNKNOWN_ERROR',
        severityEnum: SeverityEnum.DANGER,
      ));
    }
  }
}
