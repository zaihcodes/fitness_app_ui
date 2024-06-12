import 'package:fitnees_app_ui/core/data/difficulty_level_data.dart';
import 'package:fitnees_app_ui/core/utils/widgets/choice_card_widget.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_app_bar.dart';
import 'package:fitnees_app_ui/core/utils/widgets/difficulty_card_one.dart';
import 'package:fitnees_app_ui/features/plan/level_info_screen.dart';
import 'package:fitnees_app_ui/features/plan/where_to_train_screen.dart';
import 'package:flutter/material.dart';

import '../../core/data/workout_plan_data.dart';
import '../../core/enums/custom_enums.dart';

class SelectWorkoutScreen extends StatefulWidget {
  const SelectWorkoutScreen({super.key});

  @override
  State<SelectWorkoutScreen> createState() => _SelectWorkoutScreenState();
}

class _SelectWorkoutScreenState extends State<SelectWorkoutScreen> {
  Gender gender = Gender.men;
  bool filterByTarget = true;
  bool showFilter = true;

  void _handleGenderChange(Gender? value) {
    setState(() {
      gender = value!;
    });
  }

  void _handleTargetChange(bool value) {
    setState(() {
      filterByTarget = value;
    });
  }

  void _handleFilterToggle() {
    setState(() {
      showFilter = !showFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Select your workout plan', theme: theme),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildFilterOptions(),
              const SizedBox(height: 10),
              filterByTarget ? _buildWorkoutPlans() : _buildDifficultyLevels(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterOptions() {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: GestureDetector(
            onTap: _handleFilterToggle,
            child:
                Icon(showFilter ? Icons.arrow_drop_up : Icons.arrow_drop_down),
          ),
        ),
        if (showFilter) _buildFilterForm() else _buildFilterSummary(),
      ],
    );
  }

  Widget _buildFilterForm() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Group by target',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 10),
            Switch(
              value: filterByTarget,
              onChanged: _handleTargetChange,
            ),
          ],
        ),
        _buildGenderSelection(),
      ],
    );
  }

  Widget _buildFilterSummary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${filterByTarget ? 'Grouped' : 'Not Grouped'}, ${gender == Gender.men ? 'Men' : 'Women'}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _buildGenderSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile<Gender>(
              value: Gender.men,
              title: const Text('Men'),
              onChanged: _handleGenderChange,
              groupValue: gender,
            ),
          ),
          Expanded(
            child: RadioListTile<Gender>(
              value: Gender.women,
              title: const Text('Women'),
              onChanged: _handleGenderChange,
              groupValue: gender,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutPlans() {
    return Column(
      children: WorkoutPlanData.data
          .where((plan) => plan.gender == gender)
          .map((plan) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ChoiceCardWidget(
                  text: plan.name,
                  imageUrl: gender == Gender.men
                      ? 'assets/images/gigafit dubai club 3.jpg'
                      : 'assets/images/gigafit dubai club 5.jpg',
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WhereToTrainScreen(workoutPlanModel: plan)),
                    );
                  },
                ),
              ))
          .toList(),
    );
  }

  Widget _buildDifficultyLevels() {
    return Column(
      children: DifficultyLevelData.data
          .where((level) => level.gender == gender)
          .map((level) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: DifficultyCardOne(
                  level: level,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LevelInfoScreen(
                        level: level,
                      );
                    }));
                  },
                ),
              ))
          .toList(),
    );
  }
}
