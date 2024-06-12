import 'package:fitnees_app_ui/core/models/workout_plan_model.dart';

import '../enums/custom_enums.dart';

class WorkoutPlanData {
  static List<WorkoutPlanModel> data = [
    WorkoutPlanModel("General Muscle Building", Gender.men),
    WorkoutPlanModel("Strength Training", Gender.men),
    WorkoutPlanModel("Cardio Training", Gender.women),
    WorkoutPlanModel("High-Intensity Interval Training (HIIT)", Gender.women),
    WorkoutPlanModel("CrossFit Training", Gender.men),
    WorkoutPlanModel("Flexibility and Mobility Training", Gender.women),
    WorkoutPlanModel("Pilates Training", Gender.women),
    WorkoutPlanModel("Yoga Training", Gender.women),
    WorkoutPlanModel("Bodyweight Training", Gender.men),
    WorkoutPlanModel("Functional Training", Gender.men),
    WorkoutPlanModel("Powerlifting Training", Gender.men),
    WorkoutPlanModel("Endurance Training", Gender.women),
  ];
}
