import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waffarha_challenge/app/helpers/app_colors.dart';
import 'package:waffarha_challenge/app/view/theme/font_family_style.dart';

class MainThemes {
  static final ThemeData mainLightTheme = ThemeData(
    primaryColor: AppColors.mainPrimary,
    highlightColor: Colors.transparent,
    // scaffoldBackgroundColor: Colors.white,
    fontFamily: 'DINNextLTArabic',
    textTheme: TextTheme(
      titleLarge: FontFamilyStyle.standardTextStyleW700(
        fontSize: 28.sp,
      ),
      titleMedium: FontFamilyStyle.standardTextStyleW700(fontSize: 24.sp),
      titleSmall: FontFamilyStyle.standardTextStyleW700(fontSize: 22.sp),
      bodyLarge: FontFamilyStyle.standardTextStyleW500(
        fontSize: 20.sp,
      ),
      bodyMedium: FontFamilyStyle.standardTextStyleW500(fontSize: 18.sp),
      bodySmall: FontFamilyStyle.standardTextStyleW500(fontSize: 16.sp),
      labelLarge: FontFamilyStyle.standardTextStyleW400(
        fontSize: 14.sp,
        lineHeight: 21 / 14.sp,
      ),
      labelMedium: FontFamilyStyle.standardTextStyleW400(
        fontSize: 12.sp,
      ),
      labelSmall: FontFamilyStyle.standardTextStyleW400(
        fontSize: 10.sp,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.mainPrimary,
      titleTextStyle:
          FontFamilyStyle.standardTextStyleW700(fontSize: 18.sp),
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actionsIconTheme: const IconThemeData(color: Colors.black),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: FontFamilyStyle.standardTextStyleW700(fontSize: 12.sp),
      labelColor: AppColors.mainPrimary,
      unselectedLabelStyle:
          FontFamilyStyle.standardTextStyleW500(fontSize: 12.sp),
      unselectedLabelColor: Colors.black.withOpacity(0.8),
      indicatorColor: AppColors.mainPrimary,
      indicatorSize: TabBarIndicatorSize.label,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.mainPrimary,
        textStyle: FontFamilyStyle.standardTextStyleW600(fontSize: 14.sp),
      ),
    ),
  );
}
