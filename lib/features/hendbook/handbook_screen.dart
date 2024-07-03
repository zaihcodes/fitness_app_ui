import 'package:fitnees_app_ui/core/utils/widgets/choice_card_widget.dart';
import 'package:flutter/material.dart';

class HandbookScreen extends StatelessWidget {
  const HandbookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> _handbookItems = [
      'Exercises',
      'Sport nutrition',
      'List of ingredients and calorie count',
      'Pharmacalogy',
      'Encyclopedia',
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
          itemCount: _handbookItems.length,
          itemBuilder: (context, index) {
            return ChoiceCardWidget(
              text: _handbookItems[index],
              imageUrl: 'assets/images/gigafit dubai club 2.jpg',
              toUperCase: false,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ),
      ),
    );
  }
}
