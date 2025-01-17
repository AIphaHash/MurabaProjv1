import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_5/featureDocView/data/models/user_model.dart';

class AuthService {
  static String? cookie; // Static variable to share cookies globally

  // Function for login and getting cookies
  Future<void> loginAndGetCookies(String username, String password) async {
    final loginUrl = Uri.parse('https://devdmisapi.muraba.dev/api/account/login');
    final requestBody = {
      "UserNameOrEmailAddress": username,
      "Password": password,
      "RememberMe": true,
    };

    try {
      // Log in and get cookies
      final loginResponse = await http.post(
        loginUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (loginResponse.statusCode == 200) {
        cookie = loginResponse.headers['set-cookie'];
        if (cookie == null) {
          throw Exception('Login successful, but no cookie was received.');
        }
        print('Cookie: $cookie');
      } else {
        throw Exception(
            'Login Failed: ${loginResponse.statusCode} - ${loginResponse.body}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }

  // Function to send authenticated requests
  Future<String> sendAuthenticatedRequest() async {
    final url = Uri.parse('https://devdmisapi.muraba.dev/api/app/doctor/info-as-doctor');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (cookie != null) 'Cookie': cookie!,
        },
      );

      if (response.statusCode == 200) {
        return 'Authenticated Request Successful';
      } else {
        throw Exception('Request Failed: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Error during authenticated request: $e');
    }
  }
}

class UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSource({required this.client});

  Future<List<UserModel>> getUsers() async {
    final url = 'https://devdmisapi.muraba.dev/api/app/doctor/info-as-doctor';

    final headers = {
      'accept': 'text/plain',
      'X-Requested-With': 'XMLHttpRequest',
      if (AuthService.cookie != null) 'Cookie': AuthService.cookie!,
    };

    if (AuthService.cookie == null) {
      throw Exception('Cookie is null. Please log in to retrieve a valid cookie.');
    }

    try {
      final response = await client.get(Uri.parse(url), headers: headers);

      print('Cookie Used: ${AuthService.cookie}');
      print('Server Response Status Code: ${response.statusCode}');
      print('Server Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);

        if (data is Map<String, dynamic>) {
          if (data.containsKey('enFirstName')) {
            print('Found "enFirstName" key');
            return [UserModel.fromJson(data)];
          } else if (data.containsKey('users')) {
            print('Found "users" key');
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
