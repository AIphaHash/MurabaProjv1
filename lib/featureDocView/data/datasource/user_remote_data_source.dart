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
      'Authorization':
          'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Ijc0MEIwMkQ1MjY2RjIzOUI0RUY1QjhBMzUxQTU0RjFBNzE2Q0RGQzQiLCJ4NXQiOiJkQXNDMVNadkk1dE85YmlqVWFWUEduRnMzOFEiLCJ0eXAiOiJhdCtqd3QifQ.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUwMTEvIiwiZXhwIjoxNzM5MjEzNTM5LCJpYXQiOjE3MzY2MjE1MzksImF1ZCI6IkRNSVMiLCJzY29wZSI6IkRNSVMiLCJqdGkiOiJlY2M4NzdlNi1kZDBlLTQxZjAtOGViZS01ZmMxZDNlYjljYzEiLCJzdWIiOiIzYTE3NTIyYi0xODVjLTlkMDQtMGNlNS1kNmEyOWNiNDRhYTgiLCJ1bmlxdWVfbmFtZSI6ImFtZWVyYmFzaW01MUBnbWFpbC5jb20iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhbWVlcmJhc2ltNTFAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6Itin2YXZitixINio2KfYs9mFICIsInJvbGUiOiJhZG1pbiIsImVtYWlsIjoiYW1lZXJiYXNpbTUxQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsInBob25lX251bWJlcl92ZXJpZmllZCI6IkZhbHNlIiwib2lfcHJzdCI6IkRNSVNfQXBwIiwiY2xpZW50X2lkIjoiRE1JU19BcHAiLCJvaV90a25faWQiOiIzYTE3NjhlMi05YTQ5LTY1YzMtMGYwOC0wZTU5YzhkYzkwYWUifQ.ZJDBfBjgKN7K1cP0bS8IwT-xg4KyDZvdI-jxIzf7c1rMjUyOWG0i7fr8I4VP2Mpn0At05cfPDPGVjEidn1MrCmNZTaDzVKuyiCRviZfH5RvTv153dfga2-RgcnF_ceEWii24lkK_Qy-9M5nY1raMY2PviqYi6G-UDB9mFCke2WjHD5TUNuXgD-e7A0_hLMr6uU9KJMwFQoarFDGaW238I2Mw438Ws219OX-rrOqUNEnTmgYOoR6yA03BFRFw7HOA16Ike-IdZwad30ZlLu6SE3liCtjtQSjtdUIC6UfqFS2OZOz03rCjk42LwcNkhjv9jS7yWYnoQPsNdIjFN_2yLg',
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
          throw Exception('Unexpected response structure: Response is not a JSON object.');
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
