import 'package:flutter/material.dart';

import '../model/chart_data_model.dart';

class ChartData {
  static List<ChartDataModel> lastData = [
    ChartDataModel(title: 'Back', percent: 20, color: Colors.green),
    ChartDataModel(title: 'Abs', percent: 25, color: Colors.red),
    ChartDataModel(
        title: 'Full body workout', percent: 15, color: Colors.orange),
    ChartDataModel(title: 'Chest', percent: 10, color: Colors.blue),
    ChartDataModel(title: 'Triceps', percent: 5, color: Colors.cyan),
    ChartDataModel(title: 'Shoulders', percent: 8, color: Colors.purple),
    ChartDataModel(title: 'Glutes', percent: 7, color: Colors.brown),
    ChartDataModel(title: 'Stretching', percent: 5, color: Colors.yellow),
    ChartDataModel(title: 'Cardio', percent: 5, color: Colors.pink),
  ];

  static List<ChartDataModel> weekData = [
    ChartDataModel(title: 'Back', percent: 15, color: Colors.green),
    ChartDataModel(title: 'Abs', percent: 2, color: Colors.red),
    ChartDataModel(
        title: 'Full body workout', percent: 6, color: Colors.orange),
    ChartDataModel(title: 'Chest', percent: 3, color: Colors.blue),
    ChartDataModel(title: 'Triceps', percent: 2, color: Colors.cyan),
    ChartDataModel(title: 'Shoulders', percent: 22, color: Colors.purple),
    ChartDataModel(title: 'Glutes', percent: 7, color: Colors.brown),
    ChartDataModel(title: 'Stretching', percent: 23, color: Colors.yellow),
  ];

  static List<ChartDataModel> monthData = [
    ChartDataModel(title: 'Back', percent: 25, color: Colors.green),
    ChartDataModel(title: 'Abs', percent: 20, color: Colors.red),
    ChartDataModel(
        title: 'Full body workout', percent: 15, color: Colors.orange),
    ChartDataModel(title: 'Chest', percent: 15, color: Colors.blue),
    ChartDataModel(title: 'Triceps', percent: 10, color: Colors.cyan),
    ChartDataModel(title: 'Shoulders', percent: 5, color: Colors.purple),
    ChartDataModel(title: 'Glutes', percent: 5, color: Colors.brown),
    ChartDataModel(title: 'Stretching', percent: 5, color: Colors.yellow),
    ChartDataModel(title: 'Cardio', percent: 5, color: Colors.pink),
  ];

  static List<ChartDataModel> allTimeData = [
    ChartDataModel(title: 'Back', percent: 30, color: Colors.green),
    ChartDataModel(title: 'Abs', percent: 20, color: Colors.red),
    ChartDataModel(
        title: 'Full body workout', percent: 15, color: Colors.orange),
    ChartDataModel(title: 'Chest', percent: 10, color: Colors.blue),
    ChartDataModel(title: 'Triceps', percent: 5, color: Colors.cyan),
    ChartDataModel(title: 'Shoulders', percent: 5, color: Colors.purple),
    ChartDataModel(title: 'Glutes', percent: 5, color: Colors.brown),
    ChartDataModel(title: 'Stretching', percent: 5, color: Colors.yellow),
    ChartDataModel(title: 'Cardio', percent: 5, color: Colors.pink),
  ];
}
