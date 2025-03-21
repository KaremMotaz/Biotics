import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentModel extends StudentEntity {
  StudentModel({
    required super.email,
    required super.uid,
    // required super.firstName,
    // required super.lastName,
    // required super.phoneNumber,
    // required super.grade,
    // required super.newStudent,
  });
  factory StudentModel.fromFirebaseUser(User user) {
    return StudentModel(
      // name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      email: json["email"],
      uid: json["uid"],
      // firstName: json["firstName"],
      // lastName: json["lastName"],
      // phoneNumber: json["phoneNumber"],
      // grade: json["grade"],
      // newStudent: json["newStudent"],
    );
  }

  factory StudentModel.fromEntity(StudentEntity student) {
    return StudentModel(
      email: student.email,
      uid: student.uid,
      // firstName: student.firstName,
      // lastName: student.lastName,
      // phoneNumber: student.phoneNumber,
      // grade: student.grade,
      // newStudent: student.newStudent,
    );
  }
  toMap() {
    return {
      'email': email,
      'uid': uid,
      // 'firstName': firstName,
      // 'lastName': lastName,
      // 'phoneNumber': phoneNumber,
      // 'grade': grade,
      // 'newStudent': newStudent,
    };
  }
}
