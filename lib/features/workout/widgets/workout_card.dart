import 'package:fitnees_app_ui/core/constants/app_spacing.dart';
import 'package:fitnees_app_ui/core/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({required this.workout, super.key});

  final WorkoutModel workout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(AppSpacing.medium),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(2, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          workout.locked
              ? buildWorkoutLockedProgress(theme)
              : buildWorkoutCircularProgress(theme),
          SizedBox(
            width: AppSpacing.medium,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${workout.day} workout day',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  workout.bodyParts.join('+'),
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 12.w,
            width: 12.w,
            decoration: BoxDecoration(
                color: workout.isActive
                    ? theme.colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }

  SizedBox buildWorkoutLockedProgress(ThemeData theme) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Icon(Icons.lock, color: theme.colorScheme.onSecondaryContainer),
    );
  }

  Stack buildWorkoutCircularProgress(ThemeData theme) {
    return Stack(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: CircularProgressIndicator(
            backgroundColor: theme.colorScheme.secondaryContainer,
            color: theme.colorScheme.onSecondaryContainer,
            value: 1 / 10,
          ),
        ),
        Container(
          height: 60,
          width: 60,
          child: Center(
            child: Text(
              '10%',
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
