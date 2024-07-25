import 'package:fitnees_app_ui/core/models/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({super.key, required this.feedModel});
  final FeedModel feedModel;
  @override
  Widget build(BuildContext context) {
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
