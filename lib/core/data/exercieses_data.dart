class BodyPart {
  final String part;
  final String imgPath;

  const BodyPart({
    required this.part,
    required this.imgPath,
  });
}

class BodyPartExercises {
  final String exercise;
  final String imgPath;

  const BodyPartExercises({
    required this.exercise,
    this.imgPath = 'assets/images/gym_training.jpg',
  });
}

class ExercisesData {
  static List<BodyPart> bodyParts = [
    const BodyPart(part: 'Chest', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(part: 'Back', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(part: 'Legs', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(part: 'Gluteus', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(part: 'Deltoids', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(part: 'Biceps', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(part: 'Triceps', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(part: 'Foream', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(part: 'Abs', imgPath: 'assets/images/gym_training.jpg'),
    const BodyPart(
        part: 'Functional workout', imgPath: 'assets/images/gym_training.jpg'),
  ];

  static List<String> exercises = [
    "Bench Press",
    "Squats",
    "Deadlift",
    "Pull-ups",
    "Push-ups",
    "Bicep Curls",
    "Tricep Dips",
    "Shoulder Press",
    "Leg Press",
    "Lunges",
    "Plank",
    "Sit-ups",
    "Chest Fly",
    "Lat Pulldown",
    "Leg Curls",
    "Leg Extension",
    "Seated Row",
    "Calf Raises",
    "Russian Twists",
    "Mountain Climbers"
  ];
}

final List<BodyPart> bodyParts = [
  const BodyPart(part: 'Chest', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(part: 'Back', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(part: 'Legs', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(part: 'Gluteus', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(part: 'Deltoids', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(part: 'Biceps', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(part: 'Triceps', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(part: 'Foream', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(part: 'Abs', imgPath: 'assets/images/gym_training.jpg'),
  const BodyPart(
      part: 'Functional workout', imgPath: 'assets/images/gym_training.jpg'),
];

List<String> exercises = [
  "Bench Press",
  "Squats",
  "Deadlift",
  "Pull-ups",
  "Push-ups",
  "Bicep Curls",
  "Tricep Dips",
  "Shoulder Press",
  "Leg Press",
  "Lunges",
  "Plank",
  "Sit-ups",
  "Chest Fly",
  "Lat Pulldown",
  "Leg Curls",
  "Leg Extension",
  "Seated Row",
  "Calf Raises",
  "Russian Twists",
  "Mountain Climbers"
];
