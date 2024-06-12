class WorkoutModel {
  const WorkoutModel({
    required this.day,
    this.isActive = false,
    this.locked = true,
    required this.bodyParts,
  });

  final int day;
  final bool isActive;
  final bool locked;
  final List<String> bodyParts;
}
