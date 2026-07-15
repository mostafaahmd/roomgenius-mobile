import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roomgenius_mobile/app/theme/colors.dart';
import 'package:roomgenius_mobile/features/onboarding/presentation/widgets/onboarding_progress_indicator.dart';

class OnboardingBottomCard extends StatelessWidget {
  const OnboardingBottomCard({
    required this.title,
    required this.subtitle,
    required this.currentIndex,
    required this.totalCount,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    required this.isSaving,
    super.key,
  });

  final String title;
  final String subtitle;
  final int currentIndex;
  final int totalCount;
  final String primaryButtonText;
  final VoidCallback onPrimaryPressed;
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
      padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 18.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.surface.withOpacity(0.20)),
        color: AppColors.surfaceSoft,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor,
                ),
          ),
          SizedBox(height: 12.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                  color: AppColors.black.withOpacity(0.5),
                ),
          ),
          SizedBox(height: 18.h),
          OnboardingProgressIndicator(
            currentIndex: currentIndex,
            count: totalCount,
          ),
          SizedBox(height: 22.h),
          SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withOpacity(0.88),
                  ],
                ),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: ElevatedButton(
                onPressed: isSaving ? null : onPrimaryPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.transparent,
                  foregroundColor: AppColors.white,
                  disabledBackgroundColor: AppColors.transparent,
                  disabledForegroundColor: AppColors.white,
                  shadowColor: AppColors.transparent,
                  minimumSize: Size.fromHeight(58.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                ),
                child: isSaving
                    ? SizedBox(
                        width: 18.w,
                        height: 18.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.2,
                          color: AppColors.white,
                        ),
                      )
                    : Text(
                        primaryButtonText,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
