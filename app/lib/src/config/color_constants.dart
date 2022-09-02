import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._();
  static ColorConstants _instance = ColorConstants._();
  factory ColorConstants() => _instance;
  Color primaryColor = const Color(0xFF6b5dd3);
  // Color primaryColor = Colors.deepPurple;
  Color primaryDarkColor = const Color(0xffA39BDB);
  Color lightBackgroundColor = Colors.white;
  Color darkBackgroundColor = const Color(0xff313131);
  Color primaryTextLight = Colors.black;
  Color primaryTextDark = Colors.white;
  Color accentColor = const Color(0xffA39BDB);
}

// import 'package:flutter/material.dart';

// Color hexToColor(String hex) {
//   assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
//       'hex color must be #rrggbb or #rrggbbaa');

//   return Color(
//     int.parse(hex.substring(1), radix: 16) +
//         (hex.length == 7 ? 0xff000000 : 0x00000000),
//   );
// }

// class ColorConstants {
//   static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
//   static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
//   static Color secondaryAppColor = hexToColor('#5E92F3');
//   static Color secondaryDarkAppColor = Colors.white;
// }
