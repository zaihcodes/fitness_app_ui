import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBar: buildExercisesAppBar(theme, context),
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
            )
          ],
        ),
      ),
    );
  }

  AppBar buildExercisesAppBar(ThemeData theme, BuildContext context) {
    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: theme.colorScheme.onSurface,
        ),
      ),
      title: Text(
        'Exercises',
        style: TextStyle(color: theme.colorScheme.onSurface),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_outline,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_alt_outlined,
            ))
      ],
    );
  }
}
