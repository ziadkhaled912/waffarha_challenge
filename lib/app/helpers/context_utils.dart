import 'package:flutter/material.dart';

extension AppLocalizationsX on BuildContext {

  // bool get isEn => read<LanguageCubit>().state.languageCode == 'en';

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isTabletScreen => screenWidth > 600;
}
