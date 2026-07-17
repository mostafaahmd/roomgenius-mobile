import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';

class AppRadio extends StatelessWidget {
  const AppRadio({
    required this.isActive,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: isActive ? AppColors.black : AppColors.gray300),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 16,
        height: 16,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isActive ? AppColors.black : AppColors.gray300,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
