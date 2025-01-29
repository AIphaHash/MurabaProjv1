part of 'auth_event_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLodaing extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMesseage;

  AuthFailure({required this.errorMesseage});

  @override
  List<Object?> get props => [errorMesseage];
}
