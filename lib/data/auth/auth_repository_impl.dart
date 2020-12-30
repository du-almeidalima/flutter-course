import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/domain/core/error.dart';
import 'package:firebase_chat/domain/core/severity_enum.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_repository.dart';

@Injectable(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<Either<Failure, dynamic>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final authFuture = this._firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

    return await this._performAuth(authFuture);
  }

  @override
  Future<Either<Failure, dynamic>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final authFuture = this._firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

    return await this._performAuth(authFuture);
  }

  /// Common authentication handler for Firebase Auth operations
  Future<Either<Failure, dynamic>> _performAuth(
    Future<AuthResult> authFuture,
  ) async {
    try {
      final res = await authFuture;

      // TODO: Map FirebaseResp into Domain Auth
      return right(null);
    } on PlatformException catch (e) {
      return left(Failure(
        code: e.code,
        severityEnum: SeverityEnum.DANGER,
      ));
    } catch (e) {
      return left(Failure(
        code: 'UNKNOWN_ERROR',
        severityEnum: SeverityEnum.DANGER,
      ));
    }
  }
}
