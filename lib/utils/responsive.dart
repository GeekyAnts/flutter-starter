import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  /// We will modify based on our design dimension for each type.

  // This isMobile, isTablet, isDesktop
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 620;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1030 &&
      MediaQuery.of(context).size.width > 620;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1030;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1030 then we consider it a desktop
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width >= 1030) {
          return desktop;
        }
        // If width it less then 1030 and more then 620 we consider it as tablet
        else if (MediaQuery.of(context).size.width > 620) {
          return tablet;
        }
        // Or less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }
}
