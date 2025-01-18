import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_application_5/featureDocView/data/models/user_model.dart';

class AuthService {
  final _storage = FlutterSecureStorage();
  final _encrypter = encrypt.Encrypter(encrypt.AES(
    encrypt.Key.fromLength(32),
    mode: encrypt.AESMode
        .cbc, // the key here is a 32-byte also the mode of encryption is CBC
  ));

  static String? cookie; // Static cookie to be used globally

  // Function for login and getting cookies, then making an authenticated request using the cookies
  Future<String> loginAndGetCookies(String username, String password) async {
    final loginUrl =
        Uri.parse('https://devdmisapi.muraba.dev/api/account/login');
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
        String? loginCookie = loginResponse.headers['set-cookie'];

        // Encrypt the cookie before storing it securely
        if (loginCookie != null) {
          final encryptedCookie = _encryptCookie(loginCookie);
          await _storage.write(
              key: _encrypter.toString(), value: encryptedCookie);

          // Store the cookie in the static variable for later use
          cookie = loginCookie;

          return 'Login Successful';
        }
      } else {
        throw Exception(
            'Login Failed: ${loginResponse.statusCode} - ${loginResponse.body}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
    return 'Login Failed';
  }

  // Function to send authenticated requests using the cookie
  Future<String> sendAuthenticatedRequest() async {
    final url = Uri.parse(
        'https://devdmisapi.muraba.dev/api/app/doctor/info-as-doctor');

    if (cookie == null) {
      throw Exception('No cookie found. Please log in first.');
    }

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Cookie': cookie!, // Use the cookie from the static variable
        },
      );

      if (response.statusCode == 200) {
        return 'Authenticated Request Successful';
      } else {
        throw Exception(
            'Request Failed: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Error during authenticated request: $e');
    }
  }

  // Encrypt the cookie before storing it in secure storage
  String _encryptCookie(String cookie) {
    final iv = encrypt.IV.fromLength(16); // Initialization vector
    final encrypted = _encrypter.encrypt(cookie, iv: iv);
    return encrypted.base64;
  }

  // Decrypt the cookie when retrieving it from secure storage
  String _decryptCookie(String encryptedCookie) {
    final iv = encrypt.IV.fromLength(16);
    final decrypted = _encrypter.decrypt64(encryptedCookie, iv: iv);
    return decrypted;
  }
}

class UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSource({required this.client});

  Future<List<UserModel>> getUsers() async {
    final url = 'https://devdmisapi.muraba.dev/api/app/doctor/info-as-doctor';

    if (AuthService.cookie == null) {
      throw Exception(
          'Cookie is null. Please log in to retrieve a valid cookie.');
    }

    final headers = {
      'accept': 'text/plain',
      'X-Requested-With': 'XMLHttpRequest',
      'Cookie': AuthService.cookie!,
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
