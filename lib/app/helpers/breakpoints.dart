import 'package:flutter/material.dart';

enum BreakPoints {
  mobile(0),
  tablet(480),
  desktop(1000);

  const BreakPoints(this.minimumWidth);

  final int minimumWidth;

  static BreakPoints fromWidth(double width) {
    if (width > desktop.minimumWidth) {
      return BreakPoints.desktop;
    } else if (width > tablet.minimumWidth && width < desktop.minimumWidth) {
      return BreakPoints.tablet;
    } else {
      return BreakPoints.mobile;
    }
  }

  static bool isMobile(BuildContext context) {
    return fromWidth(MediaQuery.of(context).size.width) == BreakPoints.mobile;
  }

  static bool isTablet(BuildContext context) {
    return fromWidth(MediaQuery.of(context).size.width) == BreakPoints.tablet;
  }

  static bool isDesktop(BuildContext context) {
    return fromWidth(MediaQuery.of(context).size.width) == BreakPoints.desktop;
  }

  static bool isNotMobile(BuildContext context) {
    return !isMobile(context);
  }

  static double get maxWidth => 749;
}
