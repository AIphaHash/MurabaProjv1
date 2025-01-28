import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final Function(String) onLanguageChanged;

  const LanguageDropdown({Key? key, required this.onLanguageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.language, size: 20, color: Colors.black), // Only the icon
      onSelected: (String newValue) {
        onLanguageChanged(newValue);
      },
       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'en',
          child: Text('English'),
        ),
        PopupMenuItem<String>(
          value: 'ar',
          child: Text('Arabic'),
        ),
      ],
    );
  }
}