import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar CustomAppBar({required String title, required ThemeData theme}) {
  return AppBar(
    backgroundColor: theme.colorScheme.surface,
    elevation: 0,
    shadowColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        color: theme.colorScheme.onSurface,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
