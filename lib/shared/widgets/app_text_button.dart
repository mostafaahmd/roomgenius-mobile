// 📁 core/widgets/app_text_button.dart
import 'package:flutter/material.dart';
import 'package:roomgenius_mobile/app/theme/styles.dart';
import '../../app/theme/colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.buttonText,
    required this.onPressed,
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.buttonHeight,
    this.buttonWidth,
    this.textStyle,
  });
  final double? borderRadius;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
          elevation: 0,
        ),
        child: Text(
          buttonText,
          style: textStyle ??
              AppTextStyles.boldText(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
