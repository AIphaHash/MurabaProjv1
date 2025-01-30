part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}

class switchArabic extends LanguageEvent {}

class switchEnglish extends LanguageEvent {}
