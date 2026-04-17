import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roomgenius_mobile/app/theme/styles.dart';
import '../../app/theme/colors.dart';

// app section card
class AppSectionCard extends StatelessWidget {
  const AppSectionCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.title,
    this.titlePadding,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String? title;
  final EdgeInsetsGeometry? titlePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 20.w),
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Padding(
              padding:
                  titlePadding ?? EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 8.h),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  title!,
                  style: AppTextStyles.boldText(context).copyWith(
                    fontSize: 14.sp,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
          ],
          child,
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}

// app menu tile widget for side menu / settings
class AppMenuTile extends StatelessWidget {
  const AppMenuTile({
    super.key,
    required this.title,
    this.iconPath, 
    this.icon, 
    this.leading, 
    this.onTap,
    this.showArrow = true,
    this.showLock = false,
    this.isDisabled = false,
    this.isDanger = false,
    this.trailing,
  }) : assert(iconPath != null || icon != null || leading != null,
            'Provide either iconPath, icon, or leading');

  final String title;

  final String? iconPath;
  final IconData? icon;
  final Widget? leading;

  final VoidCallback? onTap;
  final bool showArrow;
  final bool showLock;
  final bool isDisabled;
  final bool isDanger;
  final Widget? trailing;

  Widget _buildLeading() {
    if (leading != null) return leading!;
    if (icon != null) return Icon(icon, size: 22);
    return SvgPicture.asset(iconPath!, width: 24.w, height: 24.h);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveOnTap = isDisabled ? null : onTap;

    final titleColor = isDanger
        ? AppColors.error
        : isDisabled
            ? AppColors.gray.withOpacity(0.6)
            : AppColors.textColor;

    return ListTile(
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildLeading(),
          if (showLock)
            Positioned(
              right: -6,
              top: -6,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.gray, width: 0.5),
                ),
                child: Icon(Icons.lock, size: 12, color: AppColors.gray),
              ),
            ),
        ],
      ),
      title: Text(
        title,
        style: AppTextStyles.regularText(
          context,
          fontSize: 14,
          color: titleColor,
        ),
      ),
      trailing: trailing ??
          (showArrow
              ? Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16.sp,
                  color: AppColors.gray.withOpacity(0.6),
                )
              : null),
      onTap: effectiveOnTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }
}

// app menu switch tile widget for account info
class AppMenuSwitchTile extends StatelessWidget {
  const AppMenuSwitchTile({
    super.key,
    required this.title,
    this.iconPath,
    this.icon,
    this.leading,
    required this.value,
    required this.onChanged,
    this.isDisabled = false,
    this.isLoading = false,
  }) : assert(iconPath != null || icon != null || leading != null);

  final String title;
  final String? iconPath;
  final IconData? icon;
  final Widget? leading;

  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final disabled = isDisabled || isLoading;

    return AppMenuTile(
      title: title,
      iconPath: iconPath,
      icon: icon,
      leading: leading,
      showArrow: false,
      isDisabled: disabled,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading)
            SizedBox(
              width: 16.w,
              height: 16.w,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
          if (isLoading) SizedBox(width: 10.w),
          Transform.scale(
            scale: 0.95,
            child: Switch(
              value: value,
              onChanged: disabled ? null : onChanged,
            ),
          ),
        ],
      ),
      onTap: () => disabled ? null : onChanged(!value),
    );
  }
}
