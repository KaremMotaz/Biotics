import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/auth_failure.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/firestore_failure.dart';
import '../../../../core/helpers/backend_endpoint.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/services/data_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../generated/l10n.dart';
import '../../domain/auth_repo.dart';
import '../../domain/student_entity.dart';
import '../models/student_model.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImp({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, StudentEntity>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required S locale,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      StudentEntity studentEntity = StudentEntity(
        email: email,
        uid: user!.uid,
      );
      await addStudentData(studentEntity: studentEntity);
      return right(studentEntity);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthFailure.fromCode(e.code, locale),
      );
    } on FirestoreFailure catch (e) {
      return left(
        FirestoreFailure.fromCode(e.errMessage, locale),
      );
    } catch (e) {
      return left(AuthFailure(locale.unknownAuthError));
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
    required S locale,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(StudentEntity(
        email: email,
        uid: user!.uid,
      ));
    } on FirebaseAuthException catch (e) {
      return left(
        AuthFailure.fromCode(e.code, locale),
      );
    } catch (e) {
      return left(AuthFailure(locale.unknownAuthError));
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> signinWithGoogle(
      {required S locale}) async {
    User? user;
    try {
      user = await firebaseAuthService.signinWithGoogle();
      StudentEntity studentEntity = StudentModel.fromFirebaseUser(user);
      await addStudentData(studentEntity: studentEntity);
      return right(studentEntity);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthFailure.fromCode(e.code, locale),
      );
    } catch (e) {
      return left(AuthFailure(locale.unknownAuthError));
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> signinWithFacebook(
      {required S locale}) async {
    User? user;
    try {
      user = await firebaseAuthService.signinWithFacebook();
      StudentEntity studentEntity = StudentModel.fromFirebaseUser(user);
      await addStudentData(studentEntity: studentEntity);
      return right(studentEntity);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthFailure.fromCode(e.code, locale),
      );
    } catch (e) {
      return left(AuthFailure(locale.unknownAuthError));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendLinkToResetPassword(
      {required String email, required S locale}) async {
    try {
      await firebaseAuthService.sendLinkToResetPassword(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthFailure.fromCode(e.code, locale),
      );
    } catch (e) {
      return left(AuthFailure(locale.unknownAuthError));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendEmailVerification(
      {required S locale}) async {
    try {
      await firebaseAuthService.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(
        AuthFailure.fromCode(e.code, locale),
      );
    } catch (e) {
      return left(AuthFailure(locale.unknownAuthError));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut({required S locale}) async {
    try {
      await firebaseAuthService.logOut();
    } on FirebaseAuthException catch (e) {
      return left(
        AuthFailure.fromCode(e.code, locale),
      );
    }
    return left(AuthFailure(locale.unknownAuthError));
  }

  @override
  Future<Either<Failure, StudentEntity>> addStudentData({
    required StudentEntity studentEntity,
  }) async {
    await databaseService.addData(
      path: BackendEndpoint.addStudentData,
      data: StudentModel.fromEntity(studentEntity).toMap(),
      documentId: studentEntity.uid,
    );
    return right(studentEntity);
  }

  @override
  Future<StudentEntity> getStudentData({required String uid}) async {
    Map<String, dynamic> studentData = await databaseService.getData(
        path: BackendEndpoint.getStudentData, documentId: uid);
    return StudentModel.fromJson(studentData);
  }

  @override
  Future saveStudentData({required StudentEntity studentEntity}) async {
    String jsonData =
        jsonEncode(StudentModel.fromEntity(studentEntity).toMap());
    await Prefs.setString(kStudentData, jsonData);
  }
}
