import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const Login({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width of the parent
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // Remove default padding
          backgroundColor: Colors.black, // Black background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align items to the start
          children: [
            // Blue section with the arrow

            // Text on the right
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  text,
                  textAlign: TextAlign.right, // Align text to the right
                  style: const TextStyle(
                    color: Colors.white, // White text color
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
