import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

@freezed
abstract class ChatMessage implements _$ChatMessage{
  const ChatMessage._();

  const factory ChatMessage({
    @required String id,
    @required String content,
    @required String username,
    @required bool isMe,
  }) = _ChatMessage;
}
