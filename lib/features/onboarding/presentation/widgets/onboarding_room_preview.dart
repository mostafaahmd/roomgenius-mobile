import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingRoomPreview extends StatelessWidget {
  const OnboardingRoomPreview({
    required this.imagePath,
    required this.height,
    super.key,
  });

  final String imagePath;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: height,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28.r),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: colorScheme.primary.withOpacity(0.08),
            child: Center(
              child: Icon(
                Icons.image_outlined,
                size: 52.sp,
                color: colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
