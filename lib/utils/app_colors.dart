import 'package:flutter/material.dart';

const _neutral = <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(0xFFF9FAFC),
  250: Color(0xFFf7f7f8),
  300: Color(0xFFF4F6FA),
  350: Color(0xFFE6E9EC),
  400: Color(0xFFE2E8F0),
  450: Color(0xFFacacac),
  500: Color(0xFF94A3B8),
  600: Color(0xFF8E9DB3),
  700: Color(0xFF475569),
  800: Color(0xFF1E293B),
  900: Color(0xFF0F172A),
};

abstract class AppColors {
  static const MaterialColor purple = MaterialColor(0xFF2C36D4, _neutral);
  static const MaterialColor black = MaterialColor(0xFF000000, _neutral);
  static const MaterialColor white = MaterialColor(0xFFFFFFFF, _neutral);
}
