class OnboardingModel {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class OnBoardingData {
  static List<OnboardingModel> onboardingData = [
    OnboardingModel(
      title: 'Personalized Workouts',
      description: 'Get workouts tailored to your goals and fitness level.',
      imageUrl: 'assets/images/gigafit dubai club 1.jpg',
    ),
    OnboardingModel(
      title: 'Track Your Progress',
      description: 'Monitor your workouts and see your improvements over time.',
      imageUrl: 'assets/images/gigafit dubai club 2.jpg',
    ),
    OnboardingModel(
      title: 'Expert Guidance',
      description: 'Access tips and advice from fitness professionals.',
      imageUrl: 'assets/images/gigafit dubai club 3.jpg',
    ),
    OnboardingModel(
      title: 'Join the Community',
      description: 'Connect with other fitness enthusiasts and stay motivated.',
      imageUrl: 'assets/images/gigafit dubai club 4.jpg',
    ),
  ];
}
