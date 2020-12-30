import 'package:firebase_chat/domain/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState.initial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(const AuthState.loading());
    final res = await this._authRepository.signInWithEmailAndPassword(
          email.trim(),
          password.trim(),
        );

    res.fold(
      (error) {
        emit(AuthState.error(error));
      },
      (token) {
        emit(const AuthState.loaded());
      },
    );
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(const AuthState.loading());
    final res = await this._authRepository.createUserWithEmailAndPassword(
          email.trim(),
          password.trim(),
        );

    res.fold(
      (error) {
        emit(AuthState.error(error));
      },
      (token) {
        emit(const AuthState.loaded());
      },
    );
  }
}
