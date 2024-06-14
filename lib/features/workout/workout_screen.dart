import 'package:fitnees_app_ui/core/models/difficulty_level_model.dart';
import 'package:fitnees_app_ui/features/workout/menu_pages/page_need_subscribe.dart';
import 'package:fitnees_app_ui/features/workout/menu_pages/workout_workouts_page.dart';
import 'package:fitnees_app_ui/features/workout/widgets/w_custom_appbar.dart';
import 'package:fitnees_app_ui/features/workout/widgets/workout_menu.dart';
import 'package:flutter/material.dart';

import 'menu_pages/workout_dashboard_page.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({required this.level, super.key});
  final DifficultyLevelModel level;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: WCustomAppbar(theme: theme),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: WorkoutMenu(),
          ),
          SizedBox(
            height: 20,
          ),
          // Menu Page view
          Expanded(
            child: PageView(
              children: [
                WorkoutDashboardPage(level: level),
                //   Workouts
                WorkoutWorkoutsPage(level: level),
                // WorkoutDietPage(),
                const PageNeedSubscribe(
                  icon: Icons.dinner_dining_sharp,
                  description:
                      'The nutrition plan will be displayed here with an indication of the recommanded Carbohydrates, Fats and Proteins for your target',
                ),
                // WorkoutNutritionPage(),
                const PageNeedSubscribe(
                    icon: Icons.health_and_safety,
                    description:
                        'The necessary set of sports nutrition will be displayed here matched specifically for your target'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
