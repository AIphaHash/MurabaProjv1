import 'package:flutter/material.dart';

class Language with ChangeNotifier {
  String currentLanguage = 'ar';

  void languageChange({required String languag}) {  // Now accepts named parameter
    currentLanguage = languag;
    notifyListeners();
  }
}
