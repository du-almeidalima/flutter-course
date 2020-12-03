import 'package:flutter/foundation.dart';

@immutable
abstract class ChatState {
  const ChatState();
}

class ChatInitialState extends ChatState {
  const ChatInitialState();
}

class ChatMessagesLoading extends ChatState {
  const ChatMessagesLoading();
}

class ChatMessagesLoaded extends ChatState {
  final List<String> messages;

  ChatMessagesLoaded(this.messages);
}