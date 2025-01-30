import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/presentation/bloc/language_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.language, size: 20, color: Colors.black),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'en',
          child: const Text('English'),
          onTap: () {
            BlocProvider.of<LanguageBloc>(context).add(switchEnglish());
          },
        ),
        PopupMenuItem<String>(
          value: 'ar',
          child: const Text('Arabic'),
          onTap: () {
            BlocProvider.of<LanguageBloc>(context).add(switchArabic());
          },
        ),
      ],
    );
  }
}
