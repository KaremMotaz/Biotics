import 'package:biocode/core/errors/failure.dart';
import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required S locale,
  });

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
    required S locale,
  });

  Future<Either<Failure, UserEntity>> signinWithGoogle({required S locale});

  Future<Either<Failure, UserEntity>> signinWithFacebook({required S locale});
  Future<Either<Failure, Unit>> sendLinkToResetPassword(
      {required String email, required S locale});
  Future<Either<Failure, Unit>> sendEmailVerification({required S locale});
}
