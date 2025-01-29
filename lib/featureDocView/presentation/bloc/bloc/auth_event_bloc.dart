import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_5/featureDocView/data/datasource/user_remote_data_source.dart';

part 'auth_event_event.dart';
part 'auth_event_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    // Registering handlers for events
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLodaing());
    try {
      await authService.loginAndGetCookies(event.username, event.password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMesseage: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    await AuthService.storage.delete(key: 'authToken');
    emit(AuthInitial());
  }
}
