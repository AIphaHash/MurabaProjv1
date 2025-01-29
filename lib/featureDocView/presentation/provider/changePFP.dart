import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/config/config_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class ChangePFP with ChangeNotifier {
  final storage = const FlutterSecureStorage();

  Future<void> updateProfilePicture({String? id, String? imagePath}) async {
    final Uri changePfpUrl = Uri.parse('${ConfigService.get('changePFP')}');

    // Retrieve the authentication token
    final String? token = await storage.read(key: 'authToken');
    if (token == null) {
      throw Exception('Authentication token is missing. Please log in.');
    }

    // Ensure both ID and imagePath are provided before sending the request
    if (id == null || imagePath == null) {
      throw Exception('User ID and image path must be provided.');
    }

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'dmis-app': '1',
    };

    final body = jsonEncode({
      'DoctorId': id,
      'PersonalImage': imagePath,
    });

    try {
      final response =
          await http.put(changePfpUrl, headers: headers, body: body);

      if (response.statusCode == 200) {
        print("Profile picture updated successfully!");
        notifyListeners(); // Notify listeners of the change
      } else {
        print("Failed to update profile picture: ${response.body}");
        throw Exception("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      print("Error updating profile picture: $e");
      rethrow;
    }
  }
}
