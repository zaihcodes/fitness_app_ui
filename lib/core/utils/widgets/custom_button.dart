import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final bool hasBorder;
  final Color borderColor;
  final VoidCallback func;

  const CustomButton({
    super.key,
    required this.text,
    required this.func,
    this.textColor = Colors.white,
    this.bgColor = Colors.transparent,
    this.hasBorder = false,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);s
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          border: hasBorder ? Border.all(width: 1, color: borderColor) : null,
          borderRadius: BorderRadius.circular(8),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
