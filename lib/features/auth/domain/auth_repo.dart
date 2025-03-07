import 'package:biocode/core/errors/failure.dart';
import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signupWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signinWithGoogle();

  Future<Either<Failure, UserEntity>> signinWithFacebook();
}
