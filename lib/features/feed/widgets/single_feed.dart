import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleFeed extends StatelessWidget {
  const SingleFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        buildSingleFeedHeader(),
        SizedBox(height: 10.h),
        buildFeedMedia(),
        SizedBox(height: 10.h),
        buildFeedLikesComments(theme)
      ],
    );
  }

  Padding buildFeedLikesComments(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          buildFeedCountInfo(theme: theme, icon: Icons.thumb_up, count: '11'),
          SizedBox(width: 20.w),
          buildFeedCountInfo(theme: theme, icon: Icons.thumb_down, count: '0'),
          SizedBox(width: 20.w),
          buildFeedCountInfo(theme: theme, icon: Icons.comment, count: '2'),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
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
        'assets/images/gigafit dubai club 2.jpg',
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
                    'assets/images/gigafit dubai club 1.jpg',
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
                      'Nico',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text('Yesterday 06:53')
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
