import 'package:flutter/material.dart';
import 'package:roomgenius_mobile/app/theme/styles.dart';

import '../constants/app_defaults.dart';

class AppSettingsListTile extends StatelessWidget {
  const AppSettingsListTile({
    required this.label,
    super.key,
    this.trailing,
    this.onTap,
  });

  final String label;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: AppDefaults.borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppDefaults.borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: AppTextStyles.regularText(context)
                        .copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  if (trailing != null) trailing!,
                ],
              ),
              const Divider(thickness: 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
