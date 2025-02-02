import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  String language = 'ar';
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) {
      if (event is switchArabic) {
        language = 'ar';
        emit(LanguageChange(language: language));
      } else if (event is switchEnglish) {
        language = 'en';
        emit(LanguageChange(language: language));
      }
    });
  }
}
