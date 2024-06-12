import 'package:fitnees_app_ui/features/auth/screens/body_parameters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/widgets/choice_card_widget.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        centerTitle: true,
        title: Text(
          'Gender',
          style: TextStyle(
            fontSize: 22.sp,
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            ChoiceCardWidget(
              text: 'Male',
              imageUrl: 'assets/images/gigafit dubai club 1.jpg',
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BodyParametersScreen()),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            ChoiceCardWidget(
              text: 'Female',
              imageUrl: 'assets/images/gigafit dubai club 3.jpg',
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BodyParametersScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
