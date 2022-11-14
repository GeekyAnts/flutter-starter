import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._();
  static final ColorConstants _instance = ColorConstants._();
  factory ColorConstants() => _instance;
  Color primaryColor = const Color(0xFF0164ff);
  Color primaryDarkColor = const Color(0xffA39BDB);
  Color lightBackgroundColor = Colors.white;
  Color darkBackgroundColor = const Color(0xff313131);
  Color primaryTextLight = Colors.black;
  Color primaryTextDark = Colors.white;
  Color accentColor = const Color(0xffA39BDB);
}
