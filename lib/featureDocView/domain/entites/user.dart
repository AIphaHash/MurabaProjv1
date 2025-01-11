// domain/entities/user.dart
class User {
  final String id;
  final String fullName;
  final String email;
  final String membershipDate;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.membershipDate,
  });
}

// domain/repositories/user_repository.dart
abstract class UserRepository {
  Future<List<User>> fetchUsers();
}
