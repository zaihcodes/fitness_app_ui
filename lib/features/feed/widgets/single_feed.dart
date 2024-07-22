import 'package:fitnees_app_ui/core/models/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          buildSingleFeedHeader(),
          SizedBox(height: 10.h),
          buildFeedMedia(),
          SizedBox(height: 10.h),
          buildFeedLikesComments(theme)
        ],
      ),
    );
  }

  Padding buildFeedLikesComments(ThemeData theme) {
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

  SizedBox buildFeedMedia() {
    return SizedBox(
      height: 300.sp,
      child: Image.asset(
        feedModel.feedImgPath,
        fit: BoxFit.cover,
      ),
    );
  }

  Padding buildSingleFeedHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    feedModel.profileImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      feedModel.userName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(feedModel.time)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            '💚💙',
            style: TextStyle(fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
