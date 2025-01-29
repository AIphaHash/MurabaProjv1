import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_5/featureDocView/data/datasource/user_remote_data_source.dart';
import 'package:flutter_application_5/featureDocView/data/models/user_model.dart';

part 'user_event_event.dart';
part 'user_event_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRemoteDataSource userRemoteDataSource;
  UserBloc(this.userRemoteDataSource) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is FetchUsers) {
      yield UserLoading();
      try {
        final users = await userRemoteDataSource.getUsers();
        yield (UserLoaded(users));
      } catch (e) {
        yield UserError(e.toString());
      }
    }
  }
}
