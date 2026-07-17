// lib/core/widgets/section_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/styles.dart';

/// Section header with optional action pill (e.g. "See All").
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    super.key,
    this.showAction = true,
    this.actionText,
    this.onActionTap,
    this.titleStyle,
    this.actionTextStyle,
    this.actionBgColor,
    this.actionRadius,
    this.actionPadding,
  }) : assert(
          showAction == false || (actionText != null && onActionTap != null),
          'When showAction=true, actionText and onActionTap must be provided.',
        );

  final String title;

  /// show/hide "See All" pill
  final bool showAction;

  /// text inside pill (e.g. "See All")
  final String? actionText;

  /// action tap callback
  final VoidCallback? onActionTap;

  /// optional overrides
  final TextStyle? titleStyle;
  final TextStyle? actionTextStyle;
  final Color? actionBgColor;
  final double? actionRadius;
  final EdgeInsets? actionPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: titleStyle ??
                AppTextStyles.boldText(
                  context,
                  fontSize: 18,
                  color: AppColors.secondary,
                ),
          ),
        ),
        // action pill
        if (showAction) ...[
          SizedBox(width: 12.w),
          InkWell(
            onTap: onActionTap,
            borderRadius: BorderRadius.circular(actionRadius ?? 999.r),
            child: Container(
              padding: actionPadding ??
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: actionBgColor ?? AppColors.primary,
                borderRadius: BorderRadius.circular(actionRadius ?? 999.r),
              ),
              child: Text(
                actionText!,
                style: actionTextStyle ??
                    AppTextStyles.boldText(
                      context,
                      fontSize: 12,
                      color: AppColors.textColor,
                    ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
