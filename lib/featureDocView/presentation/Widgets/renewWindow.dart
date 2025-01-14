import 'package:flutter/material.dart';

class Renewwindow extends StatelessWidget {
  const Renewwindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 252, 250, 250),
      content: SizedBox(
        width: 260, // Set desired width
        height: 200, // Set desired height to accommodate buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            const Text(
              "لقد انتهت صلاحية تجديدك في نقابة الاطباء",
              textAlign: TextAlign.center, // Center text
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 207, 15, 15),
              ),
            ),
            const SizedBox(
                height: 20), // Add spacing between title and question
            const Text(
              "هل تريد تقديم طلب تجديد؟",
              textAlign: TextAlign.center, // Center text
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
                height: 30), // Add spacing between question and buttons
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Evenly space buttons
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 255, 180, 175), // Background color for "لا"
                    foregroundColor:
                        const Color.fromARGB(255, 194, 19, 19), // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 16), // Adjust padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: const Text("لا"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 217, 255, 219), // Background color for "نعم"
                    foregroundColor:
                        const Color.fromARGB(255, 38, 191, 18), // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16), // Adjust padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: const Text("نعم"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
