import 'package:fitnees_app_ui/core/utils/widgets/custom_button.dart';
import 'package:fitnees_app_ui/core/utils/widgets/difficulty_card_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/data/difficulty_level_data.dart';
import '../../core/utils/widgets/custom_app_bar.dart';
import 'level_info_screen.dart';

class MyPlansScreen extends StatelessWidget {
  const MyPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'MyPlans', theme: theme),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            CustomButton(
                text: 'ADD PRE-MADE WORKOUT',
                bgColor: theme.colorScheme.primary,
                textColor: theme.colorScheme.onPrimary,
                func: () {}),
            SizedBox(height: 10.h),
            CustomButton(
              text: 'USE WORKOUT BUILDER',
              hasBorder: true,
              textColor: theme.colorScheme.onSurface,
              borderColor: theme.colorScheme.onSurface,
              func: () {},
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index) {
                  final level = DifficultyLevelData.data[index];
                  return DifficultyCardOne(
                    isActive: index == 0,
                    level: level,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LevelInfoScreen(
                                    level: level,
                                  )));
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 5.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
