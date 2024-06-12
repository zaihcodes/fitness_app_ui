import 'package:fitnees_app_ui/core/models/workout_plan_model.dart';
import 'package:fitnees_app_ui/features/plan/difficulty_levels_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/widgets/choice_card_widget.dart';
import '../../core/utils/widgets/custom_app_bar.dart';

class WhereToTrainScreen extends StatelessWidget {
  const WhereToTrainScreen({required this.workoutPlanModel, super.key});

  final WorkoutPlanModel workoutPlanModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Where to train', theme: theme),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChoiceCardWidget(
                text: 'In the gym',
                func: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DifficultyLevelsScreen(plan: workoutPlanModel)),
                  );
                },
                imageUrl: 'assets/images/gym_training.jpg',
              ),
              SizedBox(
                height: 5.w,
              ),
              ChoiceCardWidget(
                text: 'Ah home',
                func: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DifficultyLevelsScreen(plan: workoutPlanModel)),
                  );
                },
                imageUrl: 'assets/images/home_training.jpg',
              )
            ],
          ),
        ),
      ),
    );
  }
}
