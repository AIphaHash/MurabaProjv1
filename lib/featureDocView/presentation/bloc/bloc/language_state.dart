import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  final String language;

  const LanguageState({required this.language});

  @override
  List<Object> get props => [language];
}
