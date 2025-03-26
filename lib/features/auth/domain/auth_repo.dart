import 'package:biocode/core/errors/failure.dart';
import 'package:biocode/features/auth/domain/student_entity.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, StudentEntity>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required S locale,
  });

  Future<Either<Failure, StudentEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
    required S locale,
  });

  Future<Either<Failure, StudentEntity>> signinWithGoogle({required S locale});

  Future<Either<Failure, StudentEntity>> signinWithFacebook(
      {required S locale});
  Future<Either<Failure, Unit>> sendLinkToResetPassword(
      {required String email, required S locale});
  Future<Either<Failure, Unit>> sendEmailVerification({required S locale});
  Future<Either<Failure, Unit>> logOut({required S locale});
  Future addStudentData({required StudentEntity studentEntity});
  Future saveStudentData({required StudentEntity studentEntity});
  Future<StudentEntity> getStudentData({required String uid});
}
