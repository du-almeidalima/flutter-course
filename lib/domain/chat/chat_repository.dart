import 'package:firebase_chat/data/chat/entity/ChatMessage.dart';

abstract class IChatRepository {
  Future<Stream<List<ChatMessage>>> getText();
  Future<void> sendTextMessage(String message);
}