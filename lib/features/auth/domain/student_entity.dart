class StudentEntity {
  final String email;
  final String uid;
  final String? imageUrl;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? grade;
  final String role;
  final bool oldStudent;
  final bool isPremiumStudent;

  StudentEntity({
    required this.email,
    required this.uid,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.grade,
    this.phoneNumber,
    this.role = 'Student',
    this.oldStudent = false,
    this.isPremiumStudent = false,
  });
}
