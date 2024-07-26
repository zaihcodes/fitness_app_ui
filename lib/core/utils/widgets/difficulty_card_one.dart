import 'package:fitnees_app_ui/core/models/difficulty_level_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../enums/custom_enums.dart';

class DifficultyCardOne extends StatelessWidget {
  const DifficultyCardOne(
      {required this.level, this.onTap, this.isActive = false, super.key});

  final DifficultyLevelModel level;
  final Function()? onTap;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 110.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // image: DecorationImage(
              //   image: AssetImage(imageUrl),
              //   fit: BoxFit.cover
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                level.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
          ),
          Container(
            width: size.width,
            height: 110.h,
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  level.title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      level.forGymHom == ForGymHome.gym
                          ? Icons.fitness_center
                          : Icons.home,
                      color: Colors.white,
                      size: 12.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'For Home',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: List.generate(4, (index) {
                        return Icon(
                          index <= level.stars
                              ? Icons.star
                              : Icons.star_outline,
                          color: Colors.white,
                          size: 12.w,
                        );
                      }),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      level.level,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
                Text(
                  '${level.workoutDays} workout days (${level.sessionPerWeek} sessions per week)',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: isActive
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                    child: Text(
                      'ACTIVE',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }
}
