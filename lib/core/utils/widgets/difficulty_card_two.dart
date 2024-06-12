import 'package:fitnees_app_ui/core/models/difficulty_level_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DifficultyCardTwo extends StatelessWidget {
  const DifficultyCardTwo({required this.level, this.onTap, super.key});

  final DifficultyLevelModel level;
  final Function()? onTap;

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
                Row(
                  children: List.generate(4, (index) {
                    return Icon(
                      index <= level.stars ? Icons.star : Icons.star_outline,
                      color: Colors.white,
                      size: 15.w,
                    );
                  }),
                ),
                Text(
                  level.level,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '- ${level.info[0]}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
