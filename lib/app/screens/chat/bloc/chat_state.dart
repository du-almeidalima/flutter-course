import 'package:firebase_chat/domain/core/error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState.initial() = ChatInitial;

  const factory ChatState.loading() = ChatLoading;

  const factory ChatState.loaded(
    List<dynamic> messages,
  ) = ChatLoaded;

  const factory ChatState.error(
    Failure failure,
  ) = ChatError;
}
