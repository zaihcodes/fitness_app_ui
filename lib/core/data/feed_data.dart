import '../models/feed_model.dart';

class FeedData {
  static List<FeedModel> feeds = [
    FeedModel(
      userName: 'User1',
      time: '2h ago',
      profileImg: 'assets/images/gigafit dubai club 1.jpg',
      description: 'Had a great workout session today!',
      feedImgPath: 'assets/images/gigafit dubai club 1.jpg',
      likes: 120,
      disLikes: 5,
      comments: 30,
      isFavorite: true,
    ),
    FeedModel(
      userName: 'User2',
      time: '3h ago',
      profileImg: 'assets/images/gigafit dubai club 2.jpg',
      description: 'Feeling pumped after hitting the gym!',
      feedImgPath: 'assets/images/gigafit dubai club 2.jpg',
      likes: 90,
      disLikes: 3,
      comments: 25,
      isFavorite: false,
    ),
    FeedModel(
      userName: 'User3',
      time: '4h ago',
      profileImg: 'assets/images/gigafit dubai club 3.jpg',
      description: 'A great day at Gigafit Dubai Club!',
      feedImgPath: 'assets/images/gigafit dubai club 3.jpg',
      likes: 200,
      disLikes: 10,
      comments: 50,
      isFavorite: true,
    ),
    FeedModel(
      userName: 'User4',
      time: '5h ago',
      profileImg: 'assets/images/gigafit dubai club 4.jpg',
      description: 'Love the facilities here!',
      feedImgPath: 'assets/images/gigafit dubai club 4.jpg',
      likes: 150,
      disLikes: 8,
      comments: 40,
      isFavorite: false,
    ),
  ];
}
