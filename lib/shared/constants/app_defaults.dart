import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDefaults {
  static const double radius = 10;
  static const double margin = 20;
  static const double padding = 20;

  // Granular Padding Values
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double padding16 = 16.0;
  static const double paddingLarge = 20.0;
  static const double paddingXLarge = 24.0;
  static const double paddingXXLarge = 40.0;

  // Common EdgeInsets (responsive with ScreenUtil)
  static EdgeInsets get pageHorizontal => EdgeInsets.symmetric(horizontal: padding16.w);
  static EdgeInsets get pagePadding => EdgeInsets.all(padding16.w);
  static EdgeInsets get cardPadding => EdgeInsets.symmetric(horizontal: padding16.w, vertical: padding16.h);
  static EdgeInsets get bottomButtonPadding => EdgeInsets.symmetric(horizontal: padding16.w, vertical: paddingSmall.h);
  static EdgeInsets get sheetPadding => EdgeInsets.symmetric(horizontal: padding16.w, vertical: paddingXLarge.h);

  // Grid Spacing
  static const double gridCrossAxisSpacing = 16.0;
  static const double gridMainAxisSpacing = 16.0;

  /// Used For Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  /// Used For Bottom Sheet
  static BorderRadius bottomSheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  /// Used For Top Sheet
  static BorderRadius topSheetRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Default Box Shadow used for containers
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.04),
    ),
  ];

  static Duration duration = const Duration(milliseconds: 300);
}
