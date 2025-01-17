import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/presentation/pages/Login.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the Login page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      child: Text('Logout'),
    );
  }
}