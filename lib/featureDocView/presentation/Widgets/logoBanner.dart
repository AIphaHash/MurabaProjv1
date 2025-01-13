import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // Increased height to accommodate both texts
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Reduce the width
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255), // Background color
        borderRadius: BorderRadius.circular(16), // Corner radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 8, // Blur radius for shadow
            offset: const Offset(0, 4), // Shadow offset
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu), // Dash icon (three lines)
            onPressed: () {
              // Handle menu button press
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications), // Notification icon (ring)
            onPressed: () {
              // Handle notification button press
            },
          ),
          Spacer(), // Add a spacer to push the content to the right
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
              const SizedBox(height: 4), // Space between texts
              Text(
                "نظام معلومات الطبيب", // Second Arabic text
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 0, 0), // Secondary text color
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4), // Space between texts
              Text(
                "Iraqi Medical Association", // Third text
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black, // Text color
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10), // Space between text and image
          Container(
            width: 1, // Width of the line
            height: 50, // Height of the line
            color:
                const Color.fromARGB(255, 205, 201, 201), // Color of the line
          ),
          const SizedBox(width: 10), // Space between line and image
          Padding(
            padding: const EdgeInsets.only(
                right:
                    10.0), // Adjust padding to position text next to the image
            child: Image.asset(
              'assets/images/logo-removebg-preview.png',
              width: 50, // Adjust the width of the logo
              height: 50, // Adjust the height of the logo
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(100); // Match the container height
}
