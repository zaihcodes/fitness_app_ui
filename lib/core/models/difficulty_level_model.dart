import 'package:flutter/material.dart';

import '../enums/custom_enums.dart';

class DifficultyLevelModel {
  final String title;
  final String imageUrl;
  final VoidCallback? func;
  final int stars;
  final String level;
  final String isFor;
  final List<String> info;
  final List<String> description;
  final int workoutDays;
  final int sessionPerWeek;
  final Gender gender;
  final ForGymHome forGymHom;

  DifficultyLevelModel({
    required this.title,
    required this.imageUrl,
    this.func,
    required this.stars,
    required this.level,
    required this.isFor,
    required this.info,
    required this.description,
    required this.workoutDays,
    required this.sessionPerWeek,
    required this.gender,
    required this.forGymHom,
  });
}
