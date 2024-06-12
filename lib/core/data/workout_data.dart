import 'package:fitnees_app_ui/core/models/workout_model.dart';

class WorkoutData {
  static List<List<String>> bodyPartsList = [
    ['Chest', 'triceps'],
    ['Back', 'biceps'],
    ['Legs', 'glutes'],
    ['Shoulders', 'traps'],
    ['Abs', 'core'],
    ['Cardio'],
    ['Full Body'],
    ['Chest', 'biceps'],
    ['Back', 'triceps'],
    ['Legs', 'abs'],
    ['Shoulders', 'core'],
    ['Arms'],
    ['Lower Body'],
    ['Upper Body'],
    ['Full Body Strength']
  ];

  // Create a list of 15 WorkoutModel instances with varying body parts
  static List<WorkoutModel> data = List.generate(15, (index) {
    return WorkoutModel(
      day: index + 1,
      isActive: index == 0, // Only the first item is active
      locked: index != 0,
      bodyParts: bodyPartsList[index % bodyPartsList.length],
    );
  });
}
