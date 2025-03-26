import 'package:biocode/features/auth/domain/student_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentModel extends StudentEntity {
  StudentModel({
    required super.email,
    required super.uid,
    super.firstName,
    super.lastName,
    super.imageUrl,
    super.phoneNumber,
    super.grade,
    super.role,
    super.oldStudent,
    super.isPremiumStudent,
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
      firstName: json["firstName"],
      lastName: json["lastName"],
      imageUrl: json["imageUrl"],
      phoneNumber: json["phoneNumber"],
      grade: json["grade"],
      role: json["role"],
      oldStudent: json["oldStudent"],
      uid: json["uid"],
      isPremiumStudent: json["isPremiumStudent"],
    );
  }

  factory StudentModel.fromEntity(StudentEntity student) {
    return StudentModel(
      email: student.email,
      firstName: student.firstName,
      lastName: student.lastName,
      imageUrl: student.imageUrl,
      phoneNumber: student.phoneNumber,
      grade: student.grade,
      role: student.role,
      oldStudent: student.oldStudent,
      isPremiumStudent: student.isPremiumStudent,
      uid: student.uid,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'grade': grade,
      'role': role,
      'oldStudent': oldStudent,
      'isPremiumStudent': isPremiumStudent,
      'uid': uid,
    };
  }
}
