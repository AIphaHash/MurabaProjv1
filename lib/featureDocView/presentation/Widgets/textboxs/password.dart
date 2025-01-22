import 'package:flutter/material.dart';

class PasswordBox extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordBox({
    Key? key,
    required this.controller,
    required this.hintText ,// Default hint text
  }) : super(key: key);

  @override
  State<PasswordBox> createState() => _PasswordBoxState();
}

class _PasswordBoxState extends State<PasswordBox> {
  bool _obscureText = true; // Initially obscure the password

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle password visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText, // Use the state to determine visibility
      style: const TextStyle(fontSize: 13.0, color: Colors.black),
      decoration: InputDecoration(
        hintText: widget.hintText,
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
          Icons.lock_outline, // Lock icon
          color: Color.fromARGB(255, 121, 121, 121), // Black lock icon
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined, // Eye icon
            color: const Color.fromARGB(255, 109, 109, 109),
          ),
          onPressed: _togglePasswordVisibility, // Toggle visibility on press
        ),
      ),
    );
  }
}
