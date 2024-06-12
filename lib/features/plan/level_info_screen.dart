import 'package:fitnees_app_ui/core/models/difficulty_level_model.dart';
import 'package:fitnees_app_ui/core/utils/widgets/choice_card_widget.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_app_bar.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_button.dart';
import 'package:fitnees_app_ui/features/workout/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelInfoScreen extends StatelessWidget {
  const LevelInfoScreen({required this.level, super.key});

  final DifficultyLevelModel level;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: CustomAppBar(title: 'Workout plan', theme: theme),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChoiceCardWidget(
                text: level.title,
                imageUrl: level.imageUrl,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '- ${level.workoutDays} workout days (${level.sessionPerWeek} sessions per week)',
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 16.sp,
                ),
              ),
              ...List.generate(level.info.length, (index) {
                final info = level.info[index];
                return Text(
                  '- $info',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 16.sp,
                  ),
                );
              }),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                text: 'ADD',
                func: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkoutScreen(level: level)));
                },
                bgColor: theme.colorScheme.primary,
                textColor: theme.colorScheme.onPrimary,
              ),
              SizedBox(
                height: 20.h,
              ),
              ...List.generate(level.description.length, (index) {
                final desc = level.description[index];
                return Text(
                  '$desc\n',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 16.sp,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
