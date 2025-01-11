// domain/usecases/fetch_users.dart
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart'; // Import your CustomAppBar file

class FetchUsers {
  final UserRepository repository;

  FetchUsers(this.repository);

  Future<List<User>> call() async {
    return await repository.fetchUsers();
  }
}
