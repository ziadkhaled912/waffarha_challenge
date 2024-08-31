import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waffarha_challenge/app/helpers/app_colors.dart';
import 'package:waffarha_challenge/app/view/theme/font_family_style.dart';
import 'package:waffarha_challenge/l10n/l10n.dart';

class LoadingProgress {
  LoadingProgress._();
  static bool _isLoadingAlertVisible = false;
// Function to show loader
  static void show(BuildContext context,
      {bool barrierDismissible = false,
      double height = 150,
      double width = 150,
      String? txt,
      Color? backgroundColor}) {
    if (!_isLoadingAlertVisible) {
      _isLoadingAlertVisible = true;
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierColor: backgroundColor ??
            Colors.black.withOpacity(0.5), // Colors.transparent,
        pageBuilder: (BuildContext context, _, __) {
          return WillPopScope(
            onWillPop: () async {
              _isLoadingAlertVisible = false;
              return true;
            },
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      strokeWidth: 5,
                      color: AppColors.mainPrimary,
                      // backgroundColor: AppColors.blueBlack40,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      context.l10n.loading,
                      textAlign: TextAlign.center,
                      style: FontFamilyStyle.standardTextStyleW400(
                        fontSize: 14.sp,
                        color: Colors.white,
                        lineHeight: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  // Function to remove loader
  static void remove(BuildContext context) {
    if (_isLoadingAlertVisible) {
      Navigator.of(context).pop();
      _isLoadingAlertVisible = false;
    }
  }
}
