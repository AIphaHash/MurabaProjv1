import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/presentation/bloc/bloc/language_bloc.dart';
import 'package:flutter_application_5/featureDocView/presentation/bloc/bloc/language_event.dart';
import 'package:flutter_application_5/featureDocView/presentation/bloc/bloc/language_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return PopupMenuButton<String>(
          icon: const Icon(Icons.language, size: 20, color: Colors.black),
          initialValue: state.language, // Keeps dropdown in sync with the current language
          onSelected: (String newValue) {
            context.read<LanguageBloc>().add(ChangeLanguage(newValue)); // Dispatch event
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'en',
              child: Text('English'),
            ),
            const PopupMenuItem<String>(
              value: 'ar',
              child: Text('Arabic'),
            ),
          ],
        );
      },
    );
  }
}
