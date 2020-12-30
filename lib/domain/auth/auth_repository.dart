import 'package:dartz/dartz.dart';
import 'package:firebase_chat/domain/core/error.dart';

abstract class IAuthRepository {
  Future<Either<Failure, dynamic>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failure, dynamic>> createUserWithEmailAndPassword(
    String email,
    String password,
  );
}
