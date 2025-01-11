import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 230, 0),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Image.asset(
          'assets/images/logo-removebg-preview.png', // Path to your logo image in the assets folder
          width: 40, // Adjust the width of the logo
          height: 40, // Adjust the height of the logo
        ),
      ),
      title: Text(
        "نقابة أطباء العراق", // Arabic text
        style: TextStyle(
          fontSize: 18,
          color: Colors.black, // You can adjust the color as per your needs
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
