import 'package:flutter/material.dart';

class DocProfileBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        'assets/images/DocProfile.jpg', // Path to the image in assets/images folder
        width: 80, // Adjust the width as needed
        height: 100, // Adjust the height as needed
        fit: BoxFit.cover,
      ),
    );
  }
}
