import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildButton(
    {required ThemeData theme,
    required String text,
    required VoidCallback func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: theme.colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
          color:
              text == "NEXT" ? Colors.transparent : theme.colorScheme.primary),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: text == "NEXT"
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onPrimary,
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

Widget buildPageView(
    {required ThemeData theme,
    required String title,
    required String desc,
    required String image}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 60.h,
      ),
      Container(
        width: 220.w,
        height: 220.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        desc,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.colorScheme.tertiary,
          fontSize: 16.sp,
        ),
      )
    ],
  );
}
