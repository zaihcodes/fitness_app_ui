import 'package:flutter/material.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/data/workout_data.dart';
import '../../../core/models/difficulty_level_model.dart';
import '../../../core/utils/widgets/custom_calender.dart';
import '../../../core/utils/widgets/custom_section_title.dart';
import '../../../core/utils/widgets/difficulty_card_one.dart';
import '../widgets/workout_analytics.dart';
import '../widgets/workout_card.dart';
import '../workout_schedule_screen.dart';

class WorkoutDashboardPage extends StatelessWidget {
  const WorkoutDashboardPage({required this.level, super.key});
  final DifficultyLevelModel level;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
            WorkoutAnalytics(),
          ],
        ),
      ),
    );
  }
}
