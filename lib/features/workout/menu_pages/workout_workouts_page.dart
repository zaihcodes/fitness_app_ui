import 'package:fitnees_app_ui/core/models/difficulty_level_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/data/workout_data.dart';
import '../../../core/utils/widgets/difficulty_card_one.dart';
import '../widgets/workout_card.dart';

class WorkoutWorkoutsPage extends StatelessWidget {
  const WorkoutWorkoutsPage({required this.level, super.key});
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
            ...List.generate(WorkoutData.data.length, (index) {
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
          ],
        ),
      ),
    );
  }
}
