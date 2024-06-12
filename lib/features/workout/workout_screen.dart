import 'package:fitnees_app_ui/core/constants/app_spacing.dart';
import 'package:fitnees_app_ui/core/models/difficulty_level_model.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_calender.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_section_title.dart';
import 'package:fitnees_app_ui/core/utils/widgets/difficulty_card_one.dart';
import 'package:fitnees_app_ui/features/workout/widgets/w_custom_appbar.dart';
import 'package:fitnees_app_ui/features/workout/widgets/workout_card.dart';
import 'package:fitnees_app_ui/features/workout/widgets/workout_menu.dart';
import 'package:fitnees_app_ui/features/workout/workout_schedule_screen.dart';
import 'package:flutter/material.dart';

import '../../core/data/workout_data.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({required this.level, super.key});
  final DifficultyLevelModel level;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: WCustomAppbar(theme: theme),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              WorkoutMenu(),
              SizedBox(
                height: 20,
              ),
              DifficultyCardOne(level: level),
              SizedBox(
                height: AppSpacing.large,
              ),
              CustomSectionTitle(
                title: 'Next Training',
                onPressed: () {},
              ),
              SizedBox(
                height: AppSpacing.large,
              ),
              ...List.generate(3, (index) {
                final workout = WorkoutData.data[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.small),
                  child: WorkoutCard(
                    workout: workout,
                  ),
                );
              }),
              SizedBox(
                height: AppSpacing.medium,
              ),
              CustomSectionTitle(
                title: 'Workout schedule',
                hasSeeMore: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkoutScheduleScreen()),
                  );
                },
              ),
              SizedBox(
                height: AppSpacing.small,
              ),
              CustomCalender(),
              SizedBox(
                height: AppSpacing.medium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
