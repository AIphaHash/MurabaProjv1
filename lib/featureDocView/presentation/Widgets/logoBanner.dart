import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // Adjust height as needed
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Reduce the width
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(16), // Corner radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 8, // Blur radius for shadow
            offset: const Offset(0, 4), // Shadow offset
          ),
        ],
      ),
      child: Directionality(
        textDirection:
            TextDirection.rtl, // Force RTL so the logo stays on the right
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 10.0), // Keep logo on the right
              child: Image.asset(
                'assets/images/logo-removebg-preview.png',
                width: 40, // Adjust the width of the logo
                height: 40, // Adjust the height of the logo
              ),
            ),
            const SizedBox(width: 10), // Space between logo and divider
            Container(
              width: 1, // Width of the line
              height: 50, // Height of the line
              color: const Color.fromARGB(255, 205, 201, 201), // Line color
            ),
            const SizedBox(width: 5), // Space between line and text
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Keep text aligned right
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "نقابة أطباء العراق", // First Arabic text
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black, // Text color
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 0), // Space between texts
                  Text(
                    "نظام معلومات الطبيب", // Second Arabic text
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black, // Secondary text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 0), // Space between texts
                  Text(
                    "Iraqi Medical Association", // Third text
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black, // Text color
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(100); // Match the container height
}
