// lib/core/widgets/coming_soon_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/styles.dart';

class ComingSoonDialog {
  static void show(BuildContext context, {required String featureName}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(
              Icons.construction_outlined,
              color: AppColors.primary,
              size: 24.w,
            ),
            SizedBox(width: 8.w),
            Text(
              'Coming Soon',
              style: AppTextStyles.boldText(context).copyWith(fontSize: 18.sp),
            ),
          ],
        ),
        content: Text(
          '$featureName is currently under development.\nStay tuned for updates!',
          style: AppTextStyles.regularText(context).copyWith(fontSize: 14.sp),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'OK',
              style: AppTextStyles.regularText(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
