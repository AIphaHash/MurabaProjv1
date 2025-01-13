import 'package:flutter/material.dart';

class RedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 420.0,
        height: 70, // Set the desired width
        // Set the desired width
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 189, 189), // Background color
          borderRadius: BorderRadius.circular(16.0), // Corner radius
        ),
        padding: EdgeInsets.all(16.0), // Padding inside the container
        child: Center(
          child: Text(
            'This is a widget with a blue background and rounded corners',
            style: TextStyle(
                color: const Color.fromARGB(255, 45, 90, 162), // Text color
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
