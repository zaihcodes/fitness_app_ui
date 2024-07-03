import 'package:fitnees_app_ui/core/utils/widgets/choice_card_widget.dart';
import 'package:fitnees_app_ui/features/exercises/exercises_screen.dart';
import 'package:flutter/material.dart';

class HandbookScreen extends StatelessWidget {
  const HandbookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<HandBookItem> handbookItems = [
      const HandBookItem(title: 'Exercises', screen: ExercisesScreen()),
      const HandBookItem(
          title: 'Sport nutrition', screen: Center(child: Text('Nutrition'))),
      const HandBookItem(
          title: 'List of ingredients and calorie count',
          screen: Center(child: Text('ingredients'))),
      const HandBookItem(
          title: 'Pharmacalogy', screen: Center(child: Text('Pharmacalogy'))),
      const HandBookItem(
          title: 'Encyclopedia', screen: Center(child: Text('Encyclopedia'))),
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        title: Text('Handbook'),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: handbookItems.length,
          itemBuilder: (context, index) {
            return ChoiceCardWidget(
              text: handbookItems[index].title,
              imageUrl: 'assets/images/gigafit dubai club 2.jpg',
              toUperCase: false,
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => handbookItems[index].screen),
                );
              },
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ),
      ),
    );
  }
}

class HandBookItem {
  final String title;
  final Widget screen;
  const HandBookItem({
    required this.title,
    required this.screen,
  });
}
