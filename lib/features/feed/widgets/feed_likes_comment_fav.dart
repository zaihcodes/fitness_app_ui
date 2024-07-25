import 'package:fitnees_app_ui/core/models/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedLikesCommentFav extends StatelessWidget {
  const FeedLikesCommentFav({super.key, required this.feedModel});
  final FeedModel feedModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          buildFeedCountInfo(
              theme: theme,
              icon: Icons.thumb_up,
              count: feedModel.likes.toString()),
          SizedBox(width: 20.w),
          buildFeedCountInfo(
              theme: theme,
              icon: Icons.thumb_down,
              count: feedModel.disLikes.toString()),
          SizedBox(width: 20.w),
          buildFeedCountInfo(
              theme: theme,
              icon: Icons.comment,
              count: feedModel.comments.toString()),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  feedModel.isFavorite ? Icons.star : Icons.star_outline,
                  color: Colors.amber,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Row buildFeedCountInfo(
      {required ThemeData theme,
      required IconData icon,
      required String count}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icon,
          size: 18.w,
          color: theme.colorScheme.secondary.withOpacity(0.8),
        ),
        SizedBox(width: 10.w),
        Text(
          count,
          style: TextStyle(
              fontSize: 14.sp,
              height: 0,
              color: theme.colorScheme.secondary.withOpacity(0.8)),
        )
      ],
    );
  }
}
