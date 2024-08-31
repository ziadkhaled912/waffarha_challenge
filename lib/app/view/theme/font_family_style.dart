import 'package:flutter/material.dart';
import 'package:waffarha_challenge/app/helpers/app_colors.dart';
//This class methods return the TextStyle object with specific font weight and other styles.

@immutable
class FontFamily {
  const FontFamily._();

  static const String dINNextLTArabic = "DINNextLTArabic";
}

class FontFamilyStyle {
  FontFamilyStyle._();

  static TextStyle standardTextStyleW500({
    required double fontSize,
    Color color = AppColors.mainText,
    TextDecoration decoration = TextDecoration.none,
    double lineHeight = 1.25,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.dINNextLTArabic,
        decoration: decoration,
        fontSize: fontSize,
        height: lineHeight,
      );

  static TextStyle standardTextStyleW700({
    required double fontSize,
    Color color = AppColors.mainText,
    TextDecoration decoration = TextDecoration.none,
    double lineHeight = 1.25,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.dINNextLTArabic,
        fontSize: fontSize,
        decoration: decoration,
        height: lineHeight,
      );

  static TextStyle standardTextStyleW400(
          {required double fontSize,
          Color color = AppColors.secondText,
          TextDecoration decoration = TextDecoration.none,
          double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.dINNextLTArabic,
        decoration: decoration,
        fontSize: fontSize,
        height: lineHeight,
      );

  static TextStyle standardTextStyleW600({
    required double fontSize,
    Color color = AppColors.mainText,
    TextDecoration decoration = TextDecoration.none,
    double lineHeight = 1.25,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.dINNextLTArabic,
        fontSize: fontSize,
        decoration: decoration,
        height: lineHeight,
      );
}
