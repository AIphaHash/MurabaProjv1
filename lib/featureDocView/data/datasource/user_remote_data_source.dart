import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/config/config_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_application_5/featureDocView/data/models/user_model.dart';

class AuthService with ChangeNotifier {
  static final _storage = FlutterSecureStorage();
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: ConfigService.get('baseUrl'), // Set base URL
    headers: {
      'dmis-app': '1',
    },
  ));

  static FlutterSecureStorage get storage => _storage;

  // Login and store token
  Future<String> loginAndGetCookies(String username, String password) async {
    final requestBody = {
      "UserNameOrEmailAddress": username,
      "Password": password,
    };

    try {
      final response = await _dio.post(
        '',
        data: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final String? token = responseData['accessToken'];

        if (token != null) {
          await _storage.write(key: 'authToken', value: token);
          return 'Login Successful';
        }
      }
      return 'Login Failed';
    } on DioException catch (e) {
      throw Exception('Login Failed: ${e.response?.statusCode} - ${e.message}');
    }
  }
}

class UserRemoteDataSource {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ConfigService.get('doctorLogin'),
    headers: {},
  ));

  Future<List<UserModel>> getUsers() async {
    final String? token = await AuthService._storage.read(key: 'authToken');

    if (token == null) {
      throw Exception(
          'Token is null. Please log in to retrieve a valid token.');
    }

    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.get('');

      print('Server Response Status Code: ${response.statusCode}');
      print('Server Response Body: ${response.data}');

      if (response.statusCode == 200) {
        final dynamic data = response.data;

        if (data is Map<String, dynamic>) {
          if (data.containsKey('enFirstName')) {
            return [UserModel.fromJson(data)];
          } else if (data.containsKey('users')) {
            return (data['users'] as List)
                .map((json) => UserModel.fromJson(json))
                .toList();
          } else {
            throw Exception(
                'Unexpected response structure: Missing "enFirstName" or "users" keys.');
          }
        } else {
          throw Exception(
              'Unexpected response structure: Response is not a JSON object.');
        }
      } else {
        throw Exception(
            'Unexpected error: Received status code ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException occurred: ${e.response?.statusCode} - ${e.message}');
      throw Exception('API Error: ${e.response?.statusCode} - ${e.message}');
    }
  }
}
