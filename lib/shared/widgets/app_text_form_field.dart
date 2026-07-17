// 📁 core/widgets/app_text_form_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.validator,
    super.key,
    this.contentPadding,
    this.inputTextStyle,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.isObscureText,
    this.prefixIconData,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    this.suffixIcon,
    this.hintText,
    this.autoValidate = true,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onTap,
    this.readOnly,
  });
  final bool autoValidate;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final TextStyle? inputTextStyle;
  final bool? isObscureText;
  final IconData? prefixIconData; // Icon without background
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool autofocus;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    // Priority: prefixIcon (Widget) > prefixIconData (IconData)
    final Widget? resolvedPrefixIcon = prefixIcon ??
        (prefixIconData != null
            ? Icon(
                prefixIconData,
                color: AppColors.gray, // Gray color #6D6D6D
                size: 20.sp,
              )
            : null);

    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      keyboardType: keyboardType,
      autofocus: autofocus,
      controller: controller,
      autovalidateMode: autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? AppTextStyles.textForm(context),
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor ?? AppColors.inputBackground, // #F1F3FF
        hintText: hintText,
        hintStyle: AppTextStyles.hintTextStyle(context).copyWith(
          fontSize: 14.sp,
          color: AppColors.gray400,
        ),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),

        // 39px rounded borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(39.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(39.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(39.r),
          borderSide: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(39.r),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(39.r),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),

        prefixIcon: resolvedPrefixIcon,

        // Optional: keeps spacing consistent when using custom SVG widgets
        prefixIconConstraints: BoxConstraints(
          minWidth: 42.w,
          minHeight: 42.w,
        ),

        // Suffix icon
        suffixIcon: suffixIcon,

        errorStyle: AppTextStyles.errorStyle(context),
      ),
    );
  }
}
