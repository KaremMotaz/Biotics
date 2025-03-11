import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.uid,
    required super.password,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      password: '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }
}
