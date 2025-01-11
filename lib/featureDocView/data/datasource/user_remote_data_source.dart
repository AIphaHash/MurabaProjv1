// data/datasources/user_remote_data_source.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_5/featureDocView/data/models/user_model.dart'; // Import your CustomAppBar file

class UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSource({required this.client});

  Future<List<UserModel>> getUsers() async {
    final url =
        'https://devdmisapi.muraba.dev/api/app/doctor/info?DoctorId=9f155b37-a846-42c8-b385-0eccf297a1e6';
    final headers = {
      'accept': 'text/plain',
      'Authorization':
          'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Ijc0MEIwMkQ1MjY2RjIzOUI0RUY1QjhBMzUxQTU0RjFBNzE2Q0RGQzQiLCJ4NXQiOiJkQXNDMVNadkk1dE85YmlqVWFWUEduRnMzOFEiLCJ0eXAiOiJhdCtqd3QifQ.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUwMDAvIiwiZXhwIjoxNzM5MTg4NDcxLCJpYXQiOjE3MzY1OTY0NzEsImF1ZCI6IkRNSVMiLCJzY29wZSI6IkRNSVMiLCJqdGkiOiI4YzcxMWU2MS1mYjM3LTQ0OTMtODRmOS01MTNiMDQ3MzcwMzgiLCJzdWIiOiIzYTE3NTIyYi0xODVjLTlkMDQtMGNlNS1kNmEyOWNiNDRhYTgiLCJ1bmlxdWVfbmFtZSI6ImFtZWVyYmFzaW01MUBnbWFpbC5jb20iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhbWVlcmJhc2ltNTFAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6Itin2YXZitixINio2KfYs9mFICIsInJvbGUiOiJhZG1pbiIsImVtYWlsIjoiYW1lZXJiYXNpbTUxQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsInBob25lX251bWJlcl92ZXJpZmllZCI6IkZhbHNlIiwib2lfcHJzdCI6IkRNSVNfQXBwIiwiY2xpZW50X2lkIjoiRE1JU19BcHAiLCJvaV90a25faWQiOiIzYTE3Njc2NC0xODZmLTNlNmYtOTExMi1kNTM0ZGZmYTgxZjcifQ.LdOh0pCj467ij2nTy0LHTvVB5_4t_nxkOonY9CNkCCoDb_Ysr3TBvgnDovykGP1vHlhrUN9-IKPJkqPPRz-Xi6GteSgVYB_0MWzYi4o7jocPcnZ1wI9uVF4JKLtxQc8tKlfZhjcA3VRX2kZfDtXRBkWHK27KTZ2MnVjJDc5Dk6vhGDQsrV4eF_lY-_XnWzoQieJx9yUAy8t0FIDXrjwkV3yEHlLcnunraT8eJxPTMobaxs58zBb5q5D_TUSyQeR6SMq-ToHHN-52FfgtfoTecTqEhm9js8FFkKhi6wsG_hW1mVylg2Cj_KMZEKmcq1DSGo4-CySYwJqkBNBq5B2AFg', // Replace with your actual token
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
            throw Exception('Unexpected response structure');
          }
        } else {
          throw Exception('Unexpected response structure');
        }
      } else {
        print('Response Error: ${response.statusCode}');
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Exception occurred: $e');
      rethrow;
    }
  }
}
