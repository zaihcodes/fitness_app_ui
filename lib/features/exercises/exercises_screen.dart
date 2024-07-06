import 'package:fitnees_app_ui/features/exercises/body_part_exercises_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/data/exercieses_data.dart';
import 'widgets/exerciese_app_bar.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
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
                itemCount: ExercisesData.bodyParts.length,
                itemBuilder: (context, index) {
                  final bodyPart = ExercisesData.bodyParts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BodyPartExercisesScreen()),
                      );
                    },
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
                                  image: AssetImage(bodyPart.imgPath),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Text(
                              bodyPart.part,
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

class BodyPart {
  final String part;
  final String imgPath;

  const BodyPart({
    required this.part,
    required this.imgPath,
  });
}
