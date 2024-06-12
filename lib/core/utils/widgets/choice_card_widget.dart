import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceCardWidget extends StatelessWidget {
  const ChoiceCardWidget(
      {required this.text,
      this.imageUrl = 'assets/images/gender/gender_m.jpg',
      this.func,
      super.key});

  final String text;
  final String imageUrl;
  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: func,
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
                imageUrl,
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
            width: size.width * 0.5,
            height: 110.h,
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
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
