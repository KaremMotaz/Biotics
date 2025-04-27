import '../../../../../auth/domain/student_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentEntity?> {
  StudentCubit() : super(null);
  
}
