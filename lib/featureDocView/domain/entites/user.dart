// domain/entities/user.dart
class User {
  final String ID;
  final String fullName;
  final String email;
  final String membershipDate;
  final String pfp;
  final String arFullname;
  final String profisinaloti;
  final String id;
  final String status;
  final String membershipAcceptDate;

  User({
    required this.ID,
    required this.fullName,
    required this.email,
    required this.membershipDate,
    required this.pfp,
    required this.arFullname,
    required this.profisinaloti,
    required this.id,
    required this.status,
    required this.membershipAcceptDate,
  });
}

class DoctorImage {
  final String doctorId;
  final String personalImagePath;

  DoctorImage({
    required this.doctorId,
    required this.personalImagePath,
  });
}

// domain/repositories/user_repository.dart
abstract class UserRepository {
  Future<List<User>> fetchUsers();
}
