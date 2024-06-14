import 'package:flutter/material.dart';

class WorkoutMenu extends StatefulWidget {
  const WorkoutMenu(
      {required this.currentPageIndex,
      required this.onItemSelected,
      super.key});
  final int currentPageIndex;
  final ValueChanged<int> onItemSelected;
  @override
  State<WorkoutMenu> createState() => _WorkoutMenuState();
}

class _WorkoutMenuState extends State<WorkoutMenu> {
  final List<String> menuItems = [
    'Dashboard',
    'Workouts',
    'Diet',
    'Sport nutrition',
  ];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final menuItem = menuItems[index];
            return workout_menu_item(
                index: index, theme: theme, menuItem: menuItem);
          }),
    );
  }

  GestureDetector workout_menu_item({
    required int index,
    required ThemeData theme,
    required String menuItem,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: () => widget.onItemSelected(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: widget.currentPageIndex == index
              ? theme.colorScheme.primary
              : Colors.grey.shade300,
        ),
        child: Text(
          menuItem,
          style: TextStyle(
            color: widget.currentPageIndex == index
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
