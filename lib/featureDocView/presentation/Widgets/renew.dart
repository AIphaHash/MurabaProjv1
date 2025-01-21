import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/renewWindow.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart';

class RedBackground extends StatelessWidget {
  final User user;

  const RedBackground({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      String formattedDate;

      // Check if membershipDate is null
      if (user.membershipDate == null || user.membershipDate.isEmpty) {
        formattedDate = 'null'; // Display "null" if the date is null or empty
      } else {
        // Parse the date string
        DateTime parsedDate;
        if (user.membershipDate.endsWith('Z')) {
          parsedDate = DateTime.parse(user.membershipDate).toLocal();
        } else {
          parsedDate = DateTime.parse(user.membershipDate);
        }

        // Format the parsed date
        formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
      }

      return Center(
        child: Container(
          width: 420.0,
          height: 60.0, // Height of the container
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 213, 213), // Background color
            borderRadius: BorderRadius.circular(16.0), // Corner radius
          ),
          padding: const EdgeInsets.fromLTRB(
              20.0, 8.0, 8.0, 0), // Padding inside the container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Show the popup dialog
                  showDialog(
                    context: context,
                    builder: (context) => const Renewwindow(),
                  );
                },
                child: Text(
                  'تجديد', // Display the formatted date or "null"
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Button text font size
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 255, 129, 120), // Button color
                  minimumSize: const Size(140, 0), // Button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Corner radius
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
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color: Colors.blue, // Text color
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8), // Space between text and icon
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
    } catch (e) {
      return Center(
        child: Text('Error parsing date: $e'),
      );
    }
  }
}
