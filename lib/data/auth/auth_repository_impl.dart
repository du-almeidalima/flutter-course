import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/domain/core/error.dart';
import 'package:firebase_chat/domain/core/severity_enum.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_repository.dart';

@Injectable(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final Firestore _firestore;

  AuthRepositoryImpl(this._firebaseAuth, this._firestore);

  @override
  Future<Either<Failure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await this._firebaseAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

      return right(unit);
    } catch (e) {
      return left(this._handleAuthException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> createUserWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    try {
      final authResp = await this._firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

      this._firestore.collection('users').document(authResp.user.uid).setData({
        'username': username,
        'email': email,
      });

      return right(unit);
    } catch (e) {
      return left(this._handleAuthException(e));
    }
  }

  Failure _handleAuthException(Exception exception) {
    if (exception is PlatformException) {
      return Failure(
        code: exception.code,
        severityEnum: SeverityEnum.DANGER,
      );
    }

    return Failure(
      code: 'UNKNOWN_ERROR',
      severityEnum: SeverityEnum.DANGER,
    );
  }
}
