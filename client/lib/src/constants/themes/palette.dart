import 'package:flutter/material.dart';

class Palette {
  // ignore: Dark
  static const MaterialColor color =
      MaterialColor(_colorPrimaryValue, <int, Color>{
    50: Color(0xFFEEF0FF),
    100: Color(0xFFEEF0FF),
    200: Color(0xFFC8CCDE),
    300: Color(0xFFA29EF0),
    400: Color(_colorPrimaryValue),
    500: Color(0xFF3D56F0),
    600: Color(0xFF4A43EC),
    700: Color(0xFF4A43EC),
    800: Color(0xFF4A43EC),
    900: Color(0xFF4A43EC),
  });
  static const int _colorPrimaryValue = 0xFF5669FF;

  static const MaterialColor colorWhite =
      MaterialColor(_colorWhiteValue, <int, Color>{
    100: Color(0xFFEAEAEA),
    200: Color(0xFFEDEDED),
    300: Color(0xFFF2F2F2),
    400: Color(0xFFFAFAFA),
    500: Color(_colorWhiteValue),
  });
  static const int _colorWhiteValue = 0xFFFFFFFF;

  static const MaterialColor colorGray =
      MaterialColor(_colorGrayValue, <int, Color>{
    200: Color(0xFFE4DFDF),
    300: Color(0xFF989AA6),
    400: Color(_colorGrayValue),
    500: Color(0xFF807A7A),
  });
  static const int _colorGrayValue = 0xFF747688;

  static const MaterialColor colorRed =
      MaterialColor(_colorRedValue, <int, Color>{
    200: Color(0xFFFEEEEC),
    500: Color(_colorRedValue),
  });
  static const int _colorRedValue = 0xFFF2583E;
}
