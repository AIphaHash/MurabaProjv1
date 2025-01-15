import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/renewWindow.dart';
import 'package:intl/intl.dart'; // For date formatting
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
        height: 60.0, // Height of the container
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 213, 213), // Background color
          borderRadius: BorderRadius.circular(16.0), // Corner radius
        ),
        margin: const EdgeInsets.fromLTRB(
          0,
          0,
          0,
          0,
        ),
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 0), // Padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Show the popup dialog
                    showDialog(
                      context: context,
                      builder: (context) => const Renewwindow(),
                    );
                  },
                  child: const Text(
                    '< طلب تجديد',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10, // Button text font size
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 255, 129, 120), // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 0), // Adjust padding
                    minimumSize: const Size(140, 0), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Corner radius
                    ),
                  ),
                ),
              ],
            ),
            // Right Row
            Row(
              children: [
                const Text(
                  'غير فعال',
                  style: TextStyle(
                    color: Colors.blue, // Text color
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8), // Space between text and icon
                const Icon(
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
