class FeedModel {
  final String userName;
  final String time;
  final String profileImg;
  final String description;
  final String feedImgPath;
  final int likes;
  final int disLikes;
  final int comments;
  final bool isFavorite;

  FeedModel(
      {required this.userName,
      required this.time,
      required this.profileImg,
      required this.description,
      required this.feedImgPath,
      this.likes = 0,
      this.disLikes = 0,
      this.comments = 0,
      this.isFavorite = false});
}
