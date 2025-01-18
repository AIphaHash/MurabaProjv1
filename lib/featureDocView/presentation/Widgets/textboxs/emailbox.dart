import 'package:flutter/material.dart';

class Emailbox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const Emailbox({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false, // Default to not obscure text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 13.0, color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey), // Gray hint text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
          borderSide: const BorderSide(color: Colors.grey), // Gray border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              const BorderSide(color: Colors.grey), // Gray border when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
              color: Color.fromARGB(
                  255, 122, 122, 122)), // Gray border when enabled
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        prefixIcon: const Icon(
          Icons.mail_outline, // Mail icon
          color: Color.fromARGB(255, 116, 116, 116), // Black mail icon
        ),
      ),
    );
  }
}
