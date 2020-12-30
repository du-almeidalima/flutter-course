import 'package:firebase_chat/domain/core/error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.loaded() = AuthLoaded;

  const factory AuthState.error(
    Failure failure,
  ) = AuthError;
}
