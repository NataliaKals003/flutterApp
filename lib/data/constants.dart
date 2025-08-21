//This is a Dart file that contains constants and text styles used throughout the application.
// It includes keys for theme mode, text styles for titles and descriptions, and some predefined string

import 'package:flutter/material.dart';

class KConstants {
  static const String themeModeKey = 'themeModeKey';
}

class KTextStyles {
  static const TextStyle titleTealText = TextStyle(
    color: Colors.teal,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionText = TextStyle(fontSize: 16);
}

class KValue {
  static const String basicLayout = 'Basic Layout';
  static const String cleanUi = 'CleanUi';
  static const String fixBug = 'FixBug';
  static const String keyConcepts = 'Key Concepts';
}
