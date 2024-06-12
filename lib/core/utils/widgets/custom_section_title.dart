import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle(
      {required this.title,
      this.onPressed,
      this.hasSeeMore = false,
      super.key});

  final String title;
  final bool hasSeeMore;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.tertiary,
          ),
        ),
        hasSeeMore
            ? TextButton(
                onPressed: onPressed,
                child: Text(
                  'More',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.primary,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
