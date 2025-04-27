import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../generated/l10n.dart';
import 'student_entity.dart';

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
  Future<Either<Failure, StudentEntity>> addStudentData({required StudentEntity studentEntity});
  Future saveStudentData({required StudentEntity studentEntity});
  Future<StudentEntity> getStudentData({required String uid});
}
