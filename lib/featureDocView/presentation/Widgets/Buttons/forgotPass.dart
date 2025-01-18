import 'package:flutter/material.dart';

class Forgotpass extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const Forgotpass({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // Align to the left
      children: [
        InkWell(
          onTap: onPressed,
          child: Text(
            text,
            style: textStyle ??
                const TextStyle(
                  color: Color.fromARGB(255, 105, 105, 105),
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}
