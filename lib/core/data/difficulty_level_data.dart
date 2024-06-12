import 'package:flutter/material.dart';

import '../enums/custom_enums.dart';
import '../models/difficulty_level_model.dart';

class DifficultyLevelData {
  static void exampleCallback() {
    debugPrint('Button pressed!');
  }

  static List<DifficultyLevelModel> data = [
    DifficultyLevelModel(
      title: "General Muscle Building",
      imageUrl: 'assets/images/gigafit dubai club 1.jpg',
      func: exampleCallback,
      stars: 1,
      level: "No Experience",
      isFor: "Men and Women",
      info: ["No equipment needed", "Very basic exercises"],
      description: [
        "You’ve probably heard that you should be incorporating strength training into your exercise routine. Still, hitting the weights may feel much more intimidating than taking a walk or jog around your neighborhood.",
        "While results may not always be fast, creating a solid strength training routine should show you noticeable muscle gains in a few weeks to several months."
      ],
      workoutDays: 20,
      sessionPerWeek: 2,
      gender: Gender.men,
      forGymHom: ForGymHome.gym,
    ),
    DifficultyLevelModel(
      title: "Strength Training",
      imageUrl: 'assets/images/gigafit dubai club 3.jpg',
      func: exampleCallback,
      stars: 2,
      level: "Beginner",
      isFor: "Men and Women",
      info: ["Minimal equipment needed", "Basic exercises"],
      description: [
        "Great for those new to working out",
        "Focus on form and building a routine"
      ],
      workoutDays: 30,
      sessionPerWeek: 3,
      gender: Gender.women,
      forGymHom: ForGymHome.gym,
    ),
    DifficultyLevelModel(
      title: "General Muscle Building",
      imageUrl: 'assets/images/gigafit dubai club 5.jpg',
      func: exampleCallback,
      stars: 4,
      level: "Advanced",
      isFor: "Men and Women",
      info: ["Some equipment needed", "More challenging exercises"],
      description: [
        "For those with workout experience",
        "Includes compound movements and higher intensity"
      ],
      workoutDays: 24,
      sessionPerWeek: 3,
      gender: Gender.men,
      forGymHom: ForGymHome.home,
    ),
    DifficultyLevelModel(
      title: "Strength Training",
      imageUrl: 'assets/images/gigafit dubai club 2.jpg',
      func: exampleCallback,
      stars: 5,
      level: "Expert",
      isFor: "Men and Women",
      info: ["Full gym access", "Intense workouts"],
      description: [
        "Designed for highly experienced individuals",
        "Focus on maximizing performance and results"
      ],
      workoutDays: 24,
      sessionPerWeek: 3,
      gender: Gender.women,
      forGymHom: ForGymHome.home,
    ),
    DifficultyLevelModel(
      title: "Cardio Training",
      imageUrl: 'assets/images/gigafit dubai club 4.jpg',
      func: exampleCallback,
      stars: 5,
      level: "Profi",
      isFor: "Men and Women",
      info: ["Full gym access", "High-intensity training"],
      description: [
        "For professional athletes",
        "Highest level of training with maximum intensity and volume"
      ],
      workoutDays: 24,
      sessionPerWeek: 3,
      gender: Gender.men,
      forGymHom: ForGymHome.gym,
    ),
  ];
}
