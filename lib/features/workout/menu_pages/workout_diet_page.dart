import 'package:fitnees_app_ui/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutDietPage extends StatelessWidget {
  const WorkoutDietPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150.w,
            child: Icon(
              Icons.dinner_dining_sharp,
              size: 100.w,
              color: theme.colorScheme.onSurface.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 50.h),
          SizedBox(
            width: 300.w,
            child: Text(
              'The nutrition plan will be displayed here with an indication of the recommanded Carbohydrates, Fats and Proteins for your target',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(height: 100.h),
          SizedBox(
            width: 200.w,
            child: Text(
              'Subscription is required to access this section',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 18.sp,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: 'SUBSCRIBE',
            func: () {},
            bgColor: theme.colorScheme.primary,
            textColor: theme.colorScheme.onPrimary,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
