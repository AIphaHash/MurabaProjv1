import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/LoginCard.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/logoBanner.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            'assets/images/Assets.png', // Path to the background image
            fit: BoxFit.cover, // Make the image cover the entire screen
          ),
        ),
        // Scaffold with Transparent Background
        Scaffold(
          backgroundColor: Colors.transparent, // Ensure scaffold is transparent
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo Banner
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 10.0), // Space below the logo
                  child: CustomAppBar(), // LogoBanner widget
                ),
                // Custom Login Widget
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: customLogin(), // CustomLoginWidget for login form
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
