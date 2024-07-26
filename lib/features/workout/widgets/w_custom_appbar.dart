import 'package:fitnees_app_ui/features/plan/my_plans_screen.dart';
import 'package:flutter/material.dart';

AppBar WCustomAppbar(
    {required ThemeData theme, required BuildContext context}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.history,
        color: theme.colorScheme.onSurface,
      ),
    ),
    centerTitle: true,
    title: Text(
      'Workouts',
      style: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyPlansScreen()),
          );
        },
        icon: Icon(
          Icons.menu,
          color: theme.colorScheme.onSurface,
        ),
      ),
    ],
  );
}
