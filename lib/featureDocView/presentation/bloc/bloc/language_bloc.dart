import 'package:flutter_bloc/flutter_bloc.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(language: 'ar')) {
    on<ChangeLanguage>((event, emit) {
      emit(LanguageState(language: event.newLanguage));
    });
  }
}
