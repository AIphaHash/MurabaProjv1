import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> userNames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API Call"),
      ),
      body: userNames.isNotEmpty
          ? ListView.builder(
              itemCount: userNames.length,
              itemBuilder: (context, index) {
                final userName = userNames[index];
                return ListTile(
                  title: Text(userName),
                );
              },
            )
          : const Center(
              child: Text("No data available. Tap the button to fetch users."),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetch,
        child: const Icon(Icons.download),
      ),
    );
  }

  void fetch() async {
    print('Fetching data...');
    const url =
        'https://devdmisapi.muraba.dev/api/app/doctor/info?DoctorId=23cc95d9-bf3d-4fa5-84fa-b22bc2603d61';
    final uri = Uri.parse(url);

    final headers = {
      'accept': 'text/plain',
      'Authorization':
          'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Ijc0MEIwMkQ1MjY2RjIzOUI0RUY1QjhBMzUxQTU0RjFBNzE2Q0RGQzQiLCJ4NXQiOiJkQXNDMVNadkk1dE85YmlqVWFWUEduRnMzOFEiLCJ0eXAiOiJhdCtqd3QifQ.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUwMDEvIiwiZXhwIjoxNzM5MTc0NzY4LCJpYXQiOjE3MzY1ODI3NjgsImF1ZCI6IkRNSVMiLCJzY29wZSI6IkRNSVMiLCJqdGkiOiI1OGMyNzdjOS1kOTBiLTRjNTAtYjBmOC0zMWNhYmI1ODAyMzgiLCJzdWIiOiIzYTE3NTIyYi0xODVjLTlkMDQtMGNlNS1kNmEyOWNiNDRhYTgiLCJ1bmlxdWVfbmFtZSI6ImFtZWVyYmFzaW01MUBnbWFpbC5jb20iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhbWVlcmJhc2ltNTFAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6Itin2YXZitixINio2KfYs9mFICIsInJvbGUiOiJhZG1pbiIsImVtYWlsIjoiYW1lZXJiYXNpbTUxQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsInBob25lX251bWJlcl92ZXJpZmllZCI6IkZhbHNlIiwib2lfcHJzdCI6IkRNSVNfQXBwIiwiY2xpZW50X2lkIjoiRE1JU19BcHAiLCJvaV90a25faWQiOiIzYTE3NjY5Mi1mZjJhLTNjMjAtNDg2NC1iYjc4N2UxMTA5NzYifQ.B0HrRVJwndk5bpuniozahvX96WWglOusJiVf3to0nM7GD7x-TPz2Bep85TillljyTmxg7I3Qu4oW6hR6pqlcugvM8vEw0089YDYftntHCtgmjZUgw1EC8inqefbni2uFYZ4uB_VwRQE1APIJV3zL-7Zw9o2l9Owsrd92A0ltdgntTeENtTNmdS3PZZSNCn7GNttteHululGGUX_bKRmRxJkXBh35BIduQuCwntmFlCtcrTPjWUsAwY7V---sExd4OgJr5GsDjXlU5qhWOT2BzzPSYIvK1kkQ560YHdH74-SwWWH50_jniyjWRSnka00s9X6XF3wCOyV601csaFNfRw',
      'X-Requested-With': 'XMLHttpRequest',
    };

    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Extract user name from response
        if (jsonResponse.containsKey('enFirstName')) {
          setState(() {
            userNames = [
              jsonResponse['enFirstName'] as String
            ]; // Display only the first name
          });
        } else {
          print('No users found in the response.');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }
}
