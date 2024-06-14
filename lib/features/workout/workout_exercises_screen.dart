import 'package:fitnees_app_ui/core/models/workout_model.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_button.dart';
import 'package:fitnees_app_ui/features/workout/widgets/exercises_card.dart';
import 'package:fitnees_app_ui/features/workout/widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutExercisesScreen extends StatelessWidget {
  WorkoutExercisesScreen({required this.workout, super.key});

  final WorkoutModel workout;

  final List<Map<String, dynamic>> fakExercises = [
    {'exercise': 'Treadmill', 'info': '5 min., 110-140bpm'},
    {'exercise': 'Arm circles back', 'info': '2x20'},
    {'exercise': 'Arm circles forward', 'info': '2x20'},
    {'exercise': 'Hanging side leg raise', 'info': '4x30'},
    {'exercise': 'Incline dumbbell bench press twist', 'info': '4x12x26 kp'},
    {'exercise': 'Flat bench dumbbell chest press', 'info': '4x10x34 kg'},
    {'exercise': 'Chest dips', 'info': '4x15x35 kg'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: buildAppBar(theme),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            WorkoutCard(workout: workout),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(fakExercises.length, (index) {
                    final exercise = fakExercises[index];
                    return ExercisesCard(
                        exercises: exercise['exercise'],
                        info: exercise['info']);
                  }),
                ),
              ),
            ),
            CustomButton(
              text: 'BEGIN EXERCISES',
              func: () {},
              bgColor: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'Exercises',
        style: TextStyle(
          fontSize: 20.sp,
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Skip',
            style: TextStyle(
              color: theme.colorScheme.tertiary,
              fontSize: 16.sp,
            ),
          ),
        )
      ],
    );
  }
}
