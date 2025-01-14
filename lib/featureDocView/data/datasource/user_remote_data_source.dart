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
          'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Ijc0MEIwMkQ1MjY2RjIzOUI0RUY1QjhBMzUxQTU0RjFBNzE2Q0RGQzQiLCJ4NXQiOiJkQXNDMVNadkk1dE85YmlqVWFWUEduRnMzOFEiLCJ0eXAiOiJhdCtqd3QifQ.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUwMDEvIiwiZXhwIjoxNzM5NDQ0NjU2LCJpYXQiOjE3MzY4NTI2NTYsImF1ZCI6IkRNSVMiLCJzY29wZSI6IkRNSVMiLCJqdGkiOiIxMTA5ODBjZC1iOWRjLTQ3NjgtOGFlOS03YTJlNjhhZGZkNDkiLCJzdWIiOiIzYTE3NTIyYi0xODVjLTlkMDQtMGNlNS1kNmEyOWNiNDRhYTgiLCJ1bmlxdWVfbmFtZSI6ImFtZWVyYmFzaW01MUBnbWFpbC5jb20iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhbWVlcmJhc2ltNTFAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6Itin2YXZitixINio2KfYs9mFICIsInJvbGUiOiJhZG1pbiIsImVtYWlsIjoiYW1lZXJiYXNpbTUxQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsInBob25lX251bWJlcl92ZXJpZmllZCI6IkZhbHNlIiwib2lfcHJzdCI6IkRNSVNfQXBwIiwiY2xpZW50X2lkIjoiRE1JU19BcHAiLCJvaV90a25faWQiOiIzYTE3NzZhOS0yYWY5LWZjYTgtM2JhZC0zZTM2YTMwOGViZDcifQ.O-7SohUwCryYiIxLiiSyEpxjM0Aq798xul4RBbejtQC5s2IO7Hw20s8yFO4vO6levkAvj7azvOrvRTs8vrby5Brb5lzQwGAT9-2mdOppFrx2pSbf9IHu7bXkGYlJn7IX51_VWhGc6aIcDnELX9a4hDxoj94FVOeWQam7z-MXocV6KQCBl7mFwpCRbdhPEcA-cRNk-uB-de3OmYjz9quGOKkrSCv7bzLciL_5IcxA1jAU2_qJvXMgTAZwHDYExlciBiG2v8GVRD7jeoin97ue3fn-FR2XZzZswLGlnB9S2Ms2KaSAaGj-Fy3E9hcELvDNxa7jfjLBq-thr7KOh16x7w',
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
