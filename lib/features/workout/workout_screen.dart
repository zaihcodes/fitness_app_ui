import 'package:fitnees_app_ui/core/models/difficulty_level_model.dart';
import 'package:fitnees_app_ui/features/workout/menu_pages/page_need_subscribe.dart';
import 'package:fitnees_app_ui/features/workout/menu_pages/workout_workouts_page.dart';
import 'package:fitnees_app_ui/features/workout/widgets/w_custom_appbar.dart';
import 'package:fitnees_app_ui/features/workout/widgets/workout_menu.dart';
import 'package:flutter/material.dart';

import 'menu_pages/workout_dashboard_page.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({required this.level, super.key});
  final DifficultyLevelModel level;

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  void _onMenuItemChanges(index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.animateToPage(_currentPageIndex,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void _onPageChange(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: WCustomAppbar(context: context, theme: theme),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: WorkoutMenu(
              currentPageIndex: _currentPageIndex,
              onItemSelected: _onMenuItemChanges,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Menu Page view
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChange,
              children: [
                WorkoutDashboardPage(level: widget.level),
                //   Workouts
                WorkoutWorkoutsPage(level: widget.level),
                // WorkoutDietPage(),
                const PageNeedSubscribe(
                  icon: Icons.dinner_dining_sharp,
                  description:
                      'The nutrition plan will be displayed here with an indication of the recommanded Carbohydrates, Fats and Proteins for your target',
                ),
                // WorkoutNutritionPage(),
                const PageNeedSubscribe(
                    icon: Icons.health_and_safety,
                    description:
                        'The necessary set of sports nutrition will be displayed here matched specifically for your target'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
