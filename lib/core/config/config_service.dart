import 'dart:convert';
import 'package:flutter/services.dart';

class ConfigService {
  static Map<String, dynamic>? _config;

  // Load the configuration file
  static Future<void> loadConfig() async {
    final configString = await rootBundle.loadString('lib/core/config/config.json');
    _config = jsonDecode(configString);
  }

  // Access specific values by key
  static String get(String key) {
    if (_config == null) {
      throw Exception('Config not loaded. Call loadConfig() first.');
    }
    return _config![key];
  }
}
