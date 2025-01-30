part of 'language_bloc.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}

class LanguageChange extends LanguageState {
  final String language;

  LanguageChange({required this.language});
}
