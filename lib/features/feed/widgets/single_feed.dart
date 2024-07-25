import 'package:fitnees_app_ui/core/models/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feed_header.dart';
import 'feed_likes_comment_fav.dart';

class SingleFeed extends StatelessWidget {
  const SingleFeed({super.key, required this.feedModel});
  final FeedModel feedModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(color: theme.colorScheme.surface, boxShadow: [
        BoxShadow(
          color: theme.colorScheme.shadow.withOpacity(0.2),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
        BoxShadow(
          color: theme.colorScheme.surface,
          blurRadius: 4,
          offset: Offset(0, -2),
        )
      ]),
      child: Column(
        children: [
          FeedHeader(
            feedModel: feedModel,
          ),
          SizedBox(height: 10.h),
          buildFeedMedia(),
          SizedBox(height: 10.h),
          FeedLikesCommentFav(feedModel: feedModel)
        ],
      ),
    );
  }

  SizedBox buildFeedMedia() {
    return SizedBox(
      height: 300.sp,
      child: Image.asset(
        feedModel.feedImgPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
