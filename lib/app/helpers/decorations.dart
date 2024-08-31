import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDecorations {
  static InputDecoration inputTextDecoration({
    String? hint,
    String? label,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? fillColor,
    Color? borderColor,
    Color? focusedBorderColor,
    bool? isDense,
    EdgeInsets? contentPadding,
  }) =>
      InputDecoration(
        prefixIconConstraints:
            const BoxConstraints(minHeight: 16, minWidth: 46),
        prefixIcon: prefixIcon,
        contentPadding: contentPadding ??
            (isDense == null
                ? const EdgeInsets.symmetric(horizontal: 16, vertical: 18)
                : const EdgeInsets.all(15)),
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            width: 1.5,
            color: focusedBorderColor ?? AppColors.mainPrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            width: 1.5,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(width: 1, color: AppColors.basicBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.mainPrimary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.mainPrimary),
        ),
        errorStyle: const TextStyle(
          color: AppColors.mainPrimary,
          fontWeight: FontWeight.w400,
          height: 1.0,
          fontSize: 14.0,
        ),
        hintText: hint,
        labelText: label,
        hintStyle: const TextStyle(
          color: AppColors.secondText,
          fontWeight: FontWeight.w300,
          fontSize: 12.0,
        ),
        fillColor: fillColor ?? AppColors.white,
        // focusColor: AppColors.brownishGrey,
        filled: true,
        alignLabelWithHint: true,
        isDense: isDense,
      );
}
