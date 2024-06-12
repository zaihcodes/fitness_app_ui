import 'package:fitnees_app_ui/core/models/workout_plan_model.dart';
import 'package:fitnees_app_ui/core/utils/widgets/difficulty_card_two.dart';
import 'package:fitnees_app_ui/features/plan/level_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/data/difficulty_level_data.dart';
import '../../core/utils/widgets/custom_app_bar.dart';

class DifficultyLevelsScreen extends StatelessWidget {
  const DifficultyLevelsScreen({required this.plan, super.key});
  final WorkoutPlanModel plan;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Difficulty level', theme: theme),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plan.name,
              style:
                  TextStyle(color: theme.colorScheme.primary, fontSize: 18.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final level = DifficultyLevelData.data[index];
                  return DifficultyCardTwo(
                    level: level,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LevelInfoScreen(
                                    level: level,
                                  )));
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 5.h,
                ),
                itemCount: DifficultyLevelData.data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
