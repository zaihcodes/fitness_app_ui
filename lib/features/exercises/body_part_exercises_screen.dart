import 'package:fitnees_app_ui/features/exercises/widgets/exerciese_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/data/exercieses_data.dart';

class BodyPartExercisesScreen extends StatefulWidget {
  const BodyPartExercisesScreen({super.key});

  @override
  State<BodyPartExercisesScreen> createState() =>
      _BodyPartExercisesScreenState();
}

class _BodyPartExercisesScreenState extends State<BodyPartExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: buildExercisesAppBar(theme, context, title: 'Exercises'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 40.h,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: theme.colorScheme.onSecondaryContainer,
                    size: 20.w,
                  ),
                  filled: true,
                  fillColor: theme.colorScheme.secondaryContainer,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ExercisesData.exercises.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Row(
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/gym_training.jpg'),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Text(
                              ExercisesData.exercises[index],
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
