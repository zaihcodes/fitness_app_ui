import 'package:fitnees_app_ui/core/data/difficulty_level_data.dart';
import 'package:fitnees_app_ui/features/feed/feed_screen.dart';
import 'package:fitnees_app_ui/features/workout/workout_screen.dart';
import 'package:flutter/material.dart';

import 'features/hendbook/handbook_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final level = DifficultyLevelData.data[0];
  final List<Widget> _screens = [
    WorkoutScreen(level: DifficultyLevelData.data[0]),
    const FeedScreen(),
    const Center(
      child: Text('Messages'),
    ),
    const HandbookScreen(),
    const Center(
      child: Text('More'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.secondary,
        items: [
          buildBottomNavigationBarItem(
            theme: theme,
            icon: Icons.fitness_center,
            label: 'Workouts',
          ),
          buildBottomNavigationBarItem(
            theme: theme,
            icon: Icons.feed_outlined,
            label: 'Feed',
          ),
          buildBottomNavigationBarItem(
            theme: theme,
            icon: Icons.chat,
            label: 'Messages',
          ),
          buildBottomNavigationBarItem(
            theme: theme,
            icon: Icons.book,
            label: 'Handbook',
          ),
          buildBottomNavigationBarItem(
            theme: theme,
            icon: Icons.more_horiz,
            label: 'More',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required ThemeData theme,
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: theme.colorScheme.secondary),
      label: label,
      activeIcon: Icon(
        icon,
        color: theme.colorScheme.primary,
      ),
    );
  }
}
