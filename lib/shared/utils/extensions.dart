import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext? {
  bool isDarkMode() {
    final brightness = Theme.of(this!).brightness;
    return brightness == Brightness.dark;
  }
}
