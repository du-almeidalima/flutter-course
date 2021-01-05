import 'package:dartz/dartz.dart';
import 'package:firebase_chat/domain/core/error.dart';

import 'entities/user.dart';

abstract class IAuthRepository {
  Future<Either<Failure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failure, Unit>> createUserWithEmailAndPassword(
    String email,
    String password,
    String username,
  );

  Future<User> getCurrentUser();
}
