import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeFontCubit extends Cubit<String> {
  ChangeFontCubit() : super('Roboto'); // Default font for English
  void changeFontFamily(String language) {
    if (language == 'ar') {
      emit('Cairo'); // Change to Cairo for Arabic
    } else {
      emit('Roboto'); // Default to Roboto for English for example
    }
  }
}
