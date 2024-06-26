import 'package:fitnees_app_ui/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutSingleExerciseScreen extends StatelessWidget {
  const WorkoutSingleExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: '1/14', theme: theme),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildExerciseBanner(theme),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Treadmill',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Recommended time 5 min., 110-140bpm',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  buildExerciseControlle(theme),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45.h,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter minutes',
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.5),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        child: Container(
                          height: 45.h,
                          width: 45.h,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20.w,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildExerciseControlle(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: buildProgressCercleInfo(
            theme: theme,
            text: 'No',
            info: 'Repeats required',
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: buildProgressCercleInfo(
            theme: theme,
            size: 80,
            info: 'Reset',
            locked: true,
            bgColor: theme.colorScheme.errorContainer,
            color: theme.colorScheme.onErrorContainer,
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: buildProgressCercleInfo(
            theme: theme,
            text: '0/5',
            info: 'Minutes\nmade',
            bgColor: theme.colorScheme.errorContainer,
            color: theme.colorScheme.onErrorContainer,
          ),
        ),
      ],
    );
  }

  Widget buildProgressCercleInfo({
    required ThemeData theme,
    int size = 60,
    String? text,
    required String info,
    bool locked = false,
    Color? bgColor,
    Color? color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              height: size.w,
              width: size.w,
              child: CircularProgressIndicator(
                backgroundColor:
                    bgColor ?? theme.colorScheme.secondaryContainer,
                color: color ?? theme.colorScheme.onSecondaryContainer,
                value: 0 / 10,
              ),
            ),
            Container(
              height: size.w,
              width: size.w,
              child: locked
                  ? Icon(Icons.lock,
                      color: theme.colorScheme.onSecondaryContainer)
                  : Center(
                      child: Text(
                        text!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            )
          ],
        ),
        SizedBox(height: 5.h),
        Text(
          info,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }

  Container buildExerciseBanner(ThemeData theme) {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.greenAccent),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/exercises/exercises.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20.h,
            right: 20.w,
            child: Column(
              children: [
                buildRefreshAndInfo(
                  color: theme.colorScheme.error,
                  icon: Icons.lock_reset,
                ),
                SizedBox(height: 10.h),
                buildRefreshAndInfo(
                  color: theme.colorScheme.primary,
                  icon: Icons.info_outline,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildRefreshAndInfo(
      {required Color color, required IconData icon}) {
    return Container(
      height: 40.w,
      width: 40.w,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: color),
      ),
      child: Icon(icon, color: color),
    );
  }
}
