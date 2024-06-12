import 'package:flutter/material.dart';

AppBar WCustomAppbar({required ThemeData theme}) {
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
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: theme.colorScheme.onSurface,
        ),
      ),
    ],
  );
}
