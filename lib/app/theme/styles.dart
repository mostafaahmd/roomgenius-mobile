import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  // Base font family
  static String _getFontFamily(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'ar' ? 'Cairo' : 'Product Sans';
  }

  // Get TextStyle with correct font for current locale
  static TextStyle _getLocalizedTextStyle(
    BuildContext context, {
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
  }) {
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == 'ar') {
      return GoogleFonts.cairo(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      );
    } else {
      return TextStyle(
        fontFamily: _getFontFamily(context),
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      );
    }
  }

  // ✅ Correct way - Use fontWeight instead of separate font family
  static TextStyle boldText(
    BuildContext context, {
    double? fontSize,
    Color? color,
  }) {
    return _getLocalizedTextStyle(
      context,
      fontWeight: FontWeightHelper.bold,
      color: color ?? AppColors.textColor,
      fontSize: fontSize?.sp ?? 18.sp,
    );
  }

  static TextStyle regularText(
    BuildContext context, {
    double? fontSize,
    Color? color,
  }) {
    return _getLocalizedTextStyle(
      context,
      fontWeight: FontWeightHelper.regular,
      color: color ?? AppColors.textColor,
      fontSize: fontSize?.sp ?? 14.sp,
    );
  }

  static TextStyle mediumText(
    BuildContext context, {
    double? fontSize,
    Color? color,
  }) {
    return _getLocalizedTextStyle(
      context,
      fontWeight: FontWeightHelper.medium,
      color: color ?? AppColors.textColor,
      fontSize: fontSize?.sp ?? 14.sp,
    );
  }

  static TextStyle hintTextStyle(
    BuildContext context, {
    double? fontSize,
    Color? color,
  }) {
    return _getLocalizedTextStyle(
      context,
      fontWeight: FontWeightHelper.regular,
      color: color ?? AppColors.hintTextColor,
      fontSize: fontSize?.sp ?? 14.sp,
    );
  }

  static TextStyle buttonTextStyle(
    BuildContext context, {
    double? fontSize,
    Color? color,
  }) {
    return _getLocalizedTextStyle(
      context,
      fontWeight: FontWeightHelper.regular,
      color: color ?? AppColors.whiteColor,
      fontSize: fontSize?.sp ?? 18.sp,
    );
  }

  static TextStyle errorStyle(
    BuildContext context, {
    double? fontSize,
    Color? color,
  }) {
    return _getLocalizedTextStyle(
      context,
      fontWeight: FontWeightHelper.regular,
      color: color ?? AppColors.redColor,
      fontSize: fontSize?.sp ?? 11.sp,
    );
  }

  /****************** Another style *************************/
  static TextStyle onBoardingText() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.greyColor,
    );
  }

  static TextStyle onBoardingButtonText() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.whiteColor,
    );
  }

  static TextStyle signUpAndLogin() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.greyColor,
    );
  }

  static TextStyle signUpAndLogin2() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.bold,
      color: AppColors.primary,
    );
  }

  static TextStyle textForm(
    BuildContext context, {
    double? fontSize,
    Color? color,
  }) {
    return _getLocalizedTextStyle(
      context,
      fontWeight: FontWeightHelper.medium,
      color: color ?? Colors.black,
      fontSize: fontSize?.sp ?? 13.sp,
    );
  }

  static TextStyle forgetPasswordtextStyle() {
    return TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.bold,
      color: AppColors.primary,
    );
  }

  static TextStyle alertButtonStyle() {
    return TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeightHelper.bold,
      color: AppColors.whiteColor,
    );
  }

  static TextStyle customHeaderText() {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.medium,
      color: AppColors.blackColor,
    );
  }

  static TextStyle customHeaderTextMobile() {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.medium,
      color: AppColors.whiteColor,
    );
  }

  static TextStyle onBoardingTitleText() {
    return TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeightHelper.bold,
      color: AppColors.blackColor,
    );
  }

  static TextStyle surveyTitle() {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.bold,
      color: AppColors.blackColor,
    );
  }

  static TextStyle surveyQuestion() {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: AppColors.blackColor,
    );
  }

  static TextStyle surveyChoices() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.blackColor,
    );
  }

  /// ✅ New: page title style used in GiftStepperScreen
  static TextStyle pageTitle(
    BuildContext context, {
    double? fontSize,
    Color? color,
  }) {
    return _getLocalizedTextStyle(
      context,
      fontWeight: FontWeightHelper.bold,
      color: color ?? AppColors.textColor,
      fontSize: fontSize?.sp ?? 18.sp,
    );
  }
}
