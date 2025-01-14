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
        height: 70.0, // Height of the container
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 213, 213), // Background color
          borderRadius: BorderRadius.circular(16.0), // Corner radius
        ),
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 8.0), // Padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0), // Padding for the date
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 255, 172, 172), // Background color
                    borderRadius: BorderRadius.circular(6.0), // Corner radius
                  ),
                  child: Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 174, 12, 12), // Text color
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8), // Space between date and button
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
                    backgroundColor:
                        const Color.fromARGB(255, 255, 94, 82), // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5), // Adjust padding
                    minimumSize: const Size(200, 30), // Button size
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
