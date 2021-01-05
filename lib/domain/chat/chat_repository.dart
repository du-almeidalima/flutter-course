import 'package:dartz/dartz.dart';
import 'package:firebase_chat/domain/core/error.dart';

import './entities/chat_message.dart';

abstract class IChatRepository {
  Future<Either<Failure, Stream<List<ChatMessage>>>> getText();
  Future<void> sendTextMessage(String message);
}