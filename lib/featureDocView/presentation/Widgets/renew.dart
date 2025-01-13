import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart';

class RedBackground extends StatelessWidget {
  final User user;

  const RedBackground({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse and format the date
    DateTime parsedDate = DateTime.parse(user.membershipDate);
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return Center(
      child: Container(
        width: 420.0,
        height: 70, // Set the desired height
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 189, 189), // Background color
          borderRadius: BorderRadius.circular(16.0), // Corner radius
        ),
        padding: EdgeInsets.all(16.0), // Padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0), // Add padding inside the container
              decoration: BoxDecoration(
                color: Colors.blue, // Background color
                borderRadius: BorderRadius.circular(8.0), // Corner radius
              ),
              child: Text(
                formattedDate,
                style: TextStyle(
                  color: const Color.fromARGB(255, 240, 248, 255), // Text color
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'غير فعال',
                  style: TextStyle(
                    color: Colors.blue, // Text color
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8), // Space between text and icon
                Icon(
                  Icons.calendar_today,
                  color: Colors.blue, // Icon color
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
