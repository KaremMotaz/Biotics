import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<dynamic> getData({
    required String path,
    String? documentId,
  });
  // DocumentSnapshot<Map<String, dynamic>> getStudentData({
  //   required String uid,
  // });

  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
}
