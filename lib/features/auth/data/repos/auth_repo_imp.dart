import 'package:biocode/core/errors/auth_failure.dart';
import 'package:biocode/core/errors/failure.dart';
import 'package:biocode/core/errors/firestore_failure.dart';
import 'package:biocode/core/helpers/backend_endpoint.dart';
import 'package:biocode/core/services/data_service.dart';
import 'package:biocode/core/services/firebase_auth_service.dart';
import 'package:biocode/features/auth/data/models/student_model.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/student_entity.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  Future<Either<Failure, StudentEntity>> addStudentData(
      {required StudentEntity studentEntity}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: StudentModel.fromEntity(studentEntity).toMap(),
      documentId: studentEntity.uid,
    );
    return right(studentEntity);
  }

  @override
  Future<StudentEntity> getStudentData({required String uid}) async {
    var studentData = await databaseService.getData(
        path: BackendEndpoint.getUsersData, documentId: uid);
    return StudentModel.fromJson(studentData);
  }

  @override
  Future saveStudentData({required StudentEntity studentEntity}) {
    throw UnimplementedError();
  }
}
