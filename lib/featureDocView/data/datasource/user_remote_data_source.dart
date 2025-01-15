import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_5/featureDocView/data/models/user_model.dart';

class UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSource({required this.client});

  Future<List<UserModel>> getUsers() async {
    final url =
        'https://devdmisapi.muraba.dev/api/app/doctor/info?DoctorId=336f126d-0798-4656-bfb6-7c891fa54951';
    final headers = {
      'accept': 'text/plain',
      'Authorization': 'Bearer barer token',
      'X-Requested-With': 'XMLHttpRequest',
    };

    try {
      final response = await client.get(Uri.parse(url), headers: headers);

      print('Server Response Status Code: ${response.statusCode}');
      print('Server Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);

        if (data is Map<String, dynamic>) {
          if (data.containsKey('enFirstName')) {
            print('Found "enFirstName" key');
            return [UserModel.fromJson(data as Map<String, dynamic>)];
          } else if (data.containsKey('users')) {
            print('Found "users" key');
            return (data['users'] as List)
                .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
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
