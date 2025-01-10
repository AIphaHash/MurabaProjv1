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
        'https://devdmisapi.muraba.dev/api/app/doctor/0100c8d9-4dd6-427c-a55a-79d6476d4feb/audit-log';
    final uri = Uri.parse(url);

    final headers = {
      'accept': 'text/plain',
      'Authorization':
          'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Ijc0MEIwMkQ1MjY2RjIzOUI0RUY1QjhBMzUxQTU0RjFBNzE2Q0RGQzQiLCJ4NXQiOiJkQXNDMVNadkk1dE85YmlqVWFWUEduRnMzOFEiLCJ0eXAiOiJhdCtqd3QifQ.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUwMDAvIiwiZXhwIjoxNzM5MDExNTg5LCJpYXQiOjE3MzY0MTk1ODksImF1ZCI6IkRNSVMiLCJzY29wZSI6IkRNSVMiLCJqdGkiOiJiMjRiNTI5Ny02MDFiLTQwZWYtOTM1ZS1iN2RmZDY5Y2NjMmMiLCJzdWIiOiIzYTE3NTIyYi0xODVjLTlkMDQtMGNlNS1kNmEyOWNiNDRhYTgiLCJ1bmlxdWVfbmFtZSI6ImFtZWVyYmFzaW01MUBnbWFpbC5jb20iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhbWVlcmJhc2ltNTFAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6Itin2YXZitixINio2KfYs9mFICIsInJvbGUiOiJhZG1pbiIsImVtYWlsIjoiYW1lZXJiYXNpbTUxQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsInBob25lX251bWJlcl92ZXJpZmllZCI6IkZhbHNlIiwib2lfcHJzdCI6IkRNSVNfQXBwIiwiY2xpZW50X2lkIjoiRE1JU19BcHAiLCJvaV90a25faWQiOiIzYTE3NWNkOS0xNmE2LTRhNTktODIwYi05MmE5NzhjOWI3ZTMifQ.Mie0pkFS_-_LSuupVSzsKHQNwQAZqDnINTFrBU41aOXuoRXLa8jDXyHezXW2wgKOnkkE_tFb3McnVAPf0eCksJSIIL7xirSBNwcwQRzq8YldbWf_QR4UjOZdnvVY9l1ZTt3gG1agrwr5BZ6vuS60h_nlfnmOl4cQz4ZFpOmU8nyPlE00BSGw9B3J_GKkpfVDhHTLZ8vNQGG0ODwIo_hk00crdU9v5rBj_3m9f0RY4_MefcOIYMGzDpHfg9Qd6uRNK4fUUDAt5NnljiRfSnnLheNHyn3WvYEbvheZ4LwVfpXN9w8oYEFZKkHhQ3WhILJNHEzoJwqEt0DtxojFSNl8iA',
      'X-Requested-With': 'XMLHttpRequest',
    };

    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);

        // Extract userName values from response
        setState(() {
          userNames = json
              .where((item) =>
                  item is Map<String, dynamic> && item.containsKey('userName'))
              .map<String>((item) => item['userName'] as String)
              .toList();
        });
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurfred: $e');
            print('Exception occurfred: $e');

    }
  }
}
