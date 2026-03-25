import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/theme/styles.dart';

void showAppSnackBar({
  required BuildContext context,
  required String message,
  required IconData icon,
  required Color backgroundColor
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.regularText(context).copyWith(color: Colors.white,fontSize: 12),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 100.h, left: 16.w, right: 16.w), // Added margin to clear Navbar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      duration: Duration(seconds: 3),
    ),
  );
}