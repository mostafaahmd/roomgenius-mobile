import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/theme/colors.dart';
import '../../app/theme/styles.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    required this.items,
    super.key,
    this.initialValue,
    this.onChanged,
    this.width,
  });
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final double? width;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();

    if (widget.items.isNotEmpty) {
      if (widget.initialValue != null &&
          widget.items.contains(widget.initialValue)) {
        selectedValue = widget.initialValue;
      } else {
        selectedValue = widget.items.first;
      }
    }
  }

  @override
  void didUpdateWidget(covariant CustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.items.contains(selectedValue)) {
      setState(() {
        selectedValue = widget.items.isNotEmpty ? widget.items.first : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        style: AppTextStyles.mediumText(context).copyWith(
          color: AppColors.black,
          fontSize: 14.sp,
        ),
        items: widget.items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: AppTextStyles.mediumText(context).copyWith(
                    color: AppColors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.gray300),
            borderRadius: BorderRadius.circular(50.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.gray300),
            borderRadius: BorderRadius.circular(50.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.gray300),
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.gray400,
        ),
      ),
    );
  }
}
