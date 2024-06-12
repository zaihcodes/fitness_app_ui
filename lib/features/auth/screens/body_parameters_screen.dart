import 'package:fitnees_app_ui/core/utils/widgets/custom_app_bar.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_button.dart';
import 'package:fitnees_app_ui/features/plan/select_workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyParametersScreen extends StatelessWidget {
  const BodyParametersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: CustomAppBar(title: 'Body Parameters', theme: theme),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'For the intelligent selection of weights, please fill the following data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 15.sp,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            buildBodyParamsCart(
              text: 'Your weight, Kg',
              startNumber: 35,
              endNumber: 190,
              imageUrl: 'assets/images/bodyParameters/weight_params.jpg',
            ),
            SizedBox(
              height: 10.h,
            ),
            buildBodyParamsCart(
              text: 'Your height, cm',
              startNumber: 120,
              endNumber: 260,
              imageUrl: 'assets/images/bodyParameters/height_params.jpg',
            ),
            SizedBox(
              height: 10.h,
            ),
            buildBodyParamsCart(
              text: 'Your age, years',
              startNumber: 16,
              endNumber: 100,
              imageUrl: 'assets/images/bodyParameters/age_params.jpg',
            ),
            const Spacer(),
            CustomButton(
              text: 'CONTINUE',
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectWorkoutScreen()),
                );
              },
              textColor: theme.colorScheme.onPrimary,
              bgColor: theme.colorScheme.primary,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildBodyParamsCart({
    required String text,
    String imageUrl = 'assets/images/bodyParameters/weight_params.jpg',
    required int startNumber,
    required int endNumber,
  }) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                )),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.8),
              ),
              child: Column(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 30.w,
                      perspective: 0.01,
                      diameterRatio: 1.5,
                      physics: FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        // setState(() {
                        //   selectedWeightIndex = index;
                        // });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          final number = index + startNumber;
                          return Container(
                            height: 30.w,
                            width: 80.w,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Center(
                              child: Text(
                                '$number',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: endNumber,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
