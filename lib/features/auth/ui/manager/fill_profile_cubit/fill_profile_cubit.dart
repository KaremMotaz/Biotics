import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'fill_profile_state.dart';

class FillProfileCubit extends Cubit<FillProfileState> {
  FillProfileCubit() : super(FillProfileInitialState());
  
}
