// data/repositories/user_repository_impl.dart
import 'package:flutter_application_5/featureDocView/data/datasource/user_remote_data_source.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart'; // Import your CustomAppBar file

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> fetchUsers() async {
    try {
      final userModels = await remoteDataSource.getUsers();
      return userModels
          .map((model) => User(
                fullName: model.fullName,
                email: model.email,
                membershipDate: model.membershipDate,
                pfp: model.pfp,
                arFullname: model.arFullname,
                profisinaloti: model.profisinaloti,
                id: model.id,
                status: model.status,
                membershipAcceptDate: model.membershipAcceptDate,
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }
}
