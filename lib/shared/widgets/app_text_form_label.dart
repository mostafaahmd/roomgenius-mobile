import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/theme/styles.dart';

class AppTextFormLabel extends StatelessWidget {
  final String text;
  const AppTextFormLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.regularText(context).copyWith(fontSize: 16.sp),
    );
  }
}
