import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 900;
const int smallScreenSize = 360;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? smallScreen;
  const ResponsiveWidget(
      {super.key, required this.largeScreen, this.smallScreen,});

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      double width = constrains.maxWidth;
      if (width > mediumScreenSize) {
        return largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}
