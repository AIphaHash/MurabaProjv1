import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/data/datasource/user_remote_data_source.dart';
import 'package:flutter_application_5/featureDocView/data/repository/user_repository_impl.dart';
import 'package:flutter_application_5/featureDocView/domain/useCases/fetch_users.dart';
import 'package:flutter_application_5/featureDocView/presentation/pages/HomeScreen.dart'; // Import your CustomAppBar file

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the HTTP client for the remote data source
    final httpClient = http.Client();

    // Create the remote data source
    final remoteDataSource = UserRemoteDataSource(client: httpClient);

    // Create the repository
    final userRepository =
        UserRepositoryImpl(remoteDataSource: remoteDataSource);

    // Create the FetchUsers use case
    final fetchUsers = FetchUsers(userRepository);

    return MaterialApp(
      home: Homescreen(fetchUsers: fetchUsers),
      debugShowCheckedModeBanner: false,
    );
  }
}
