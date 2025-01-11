// data/repositories/user_repository_impl.dart
import 'package:http/http.dart' as http;
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart'; // Import your CustomAppBar file
import 'package:flutter_application_5/featureDocView/data/models/user_model.dart'; // Import your CustomAppBar file
import 'package:flutter_application_5/featureDocView/data/datasource/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> fetchUsers() async {
    try {
      final userModels = await remoteDataSource.getUsers();
      return userModels
          .map((model) => User(
                id: 'dummy-id', // Assign dummy id if needed
                fullName: model.fullName,
                email: model.email,
                membershipDate: model.membershipDate,
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }
}
