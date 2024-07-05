import 'package:flutter/material.dart';

AppBar buildExercisesAppBar(ThemeData theme, BuildContext context,
    {required String title}) {
  return AppBar(
    backgroundColor: theme.colorScheme.surface,
    elevation: 0,
    scrolledUnderElevation: 0,
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
      title,
      style: TextStyle(color: theme.colorScheme.onSurface),
    ),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_outline,
          )),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt_outlined,
          ))
    ],
  );
}
