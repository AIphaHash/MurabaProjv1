import 'dart:convert';
import 'package:flutter_application_5/core/config/config_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_application_5/featureDocView/data/models/user_model.dart';

class AuthService {
  static final _storage = FlutterSecureStorage();
  static FlutterSecureStorage get storage => _storage;
  // Function for login and getting cookies, then making an authenticated request using the cookies
  Future<String> loginAndGetCookies(String username, String password) async {
    final loginUrl =
        Uri.parse('${ConfigService.get('baseUrl')}');
    final requestBody = {
      "UserNameOrEmailAddress": username,
      "Password": password,
    };

    try {
      // Log in and get Token
      final response = await http.post(
        loginUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'dmis-app': '1',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        final String? token = responseData['accessToken'];
      

        // Encrypt the cookie before storing it securely
        if (token != null) {
          await _storage.write(key: 'authToken', value: token);
          

          return 'Login Successful';
        }
      } else {
        throw Exception(
            'Login Failed: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
    return 'Login Failed';
  }
}

class UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSource({required this.client});

  Future<List<UserModel>> getUsers() async {
    final url = '${ConfigService.get('doctorLogin')}';
    final String? token = await AuthService._storage.read(key: 'authToken');

    if (token == null) {
      throw Exception(
          'Token is null. Please log in to retrieve a valid Token.');
    }

    final headers = {
      'accept': 'text/plain',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await client.get(Uri.parse(url), headers: headers);

      print('Server Response Status Code: ${response.statusCode}');
      print('Server Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);

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
      } else if (response.statusCode == 401) {
        throw Exception(
            'Unauthorized: Check if your access token is valid or has expired.');
      } else if (response.statusCode == 404) {
        throw Exception(
            'Not Found: The requested resource does not exist at the specified URL.');
      } else if (response.statusCode == 500) {
        throw Exception('Server Error: The server encountered an issue.');
      } else {
        throw Exception(
            'Unexpected error: Received status code ${response.statusCode} with response: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred: $e');
      rethrow;
    }
  }
}
