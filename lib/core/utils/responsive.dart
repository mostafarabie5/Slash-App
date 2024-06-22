import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.desktop,
      required this.mobile,
      required this.tablet});
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  ///tablet < 600
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  /// tablet >= 650
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1000;

  ///desktop >= 1000
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1000) {
        return desktop;
      } else if (constraints.maxWidth >= 600) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
