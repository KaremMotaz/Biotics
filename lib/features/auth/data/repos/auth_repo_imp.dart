import 'dart:developer';

import 'package:biocode/core/errors/failure.dart';
import 'package:biocode/core/services/firebase_auth_service.dart';
import 'package:biocode/features/auth/data/models/user_model.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> signupWithEmailAndPassword(
      {required String email, required String password}) async {
    User? user;
    try {
      user = await firebaseAuthService.signUpWithEmailAndPassword(
          email: email, password: password);

      return right(
          UserEntity(email: email, password: password, uid: user!.uid));
    } catch (e) {
      return left(
        ServerFailure(message: "There was an error, please try again later"),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      {required String email, required String password}) async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      return right(
          UserEntity(email: email, password: password, uid: user!.uid));
    } catch (e) {
      return left(
        ServerFailure(message: "There was an error, please try again later"),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signinWithGoogle();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);

      return right(userEntity);
    } catch (e) {
      return left(
        ServerFailure(
            message: "There was an error, please try again later : $e"),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signinWithFacebook();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);

      return right(userEntity);
    } catch (e) {
      log(e.toString());
      return left(
        ServerFailure(message: "There was an error, please try again later"),
      );
    }
  }
}
