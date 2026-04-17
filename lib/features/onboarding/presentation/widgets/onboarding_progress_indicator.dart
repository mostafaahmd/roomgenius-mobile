// progress indicator for onboarding screens
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// OnboardingProgressIndicator displays a progress indicator for onboarding screens.
class OnboardingProgressIndicator extends StatelessWidget {
  const OnboardingProgressIndicator({
    required this.currentIndex, required this.count, super.key,
  });
  /// currentIndex represents the current step in the onboarding process, and count represents the total number of steps.
  final int currentIndex;
  /// count represents the total number of steps in the onboarding process, which determines how many dots are displayed in the progress indicator.
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (index) {
          final isActive = index == currentIndex;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: isActive ? 22.w : 8.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF7A3CFF)
                  : const Color(0xFFD1D5DB),
              borderRadius: BorderRadius.circular(999.r),
            ),
          );
        },
      ),
    );
  }
}