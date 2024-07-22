import 'package:fitnees_app_ui/core/data/feed_data.dart';
import 'package:fitnees_app_ui/features/feed/widgets/single_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<String> feedChoice = ['Sport Feed', 'Favorites', 'New comments'];
  late String _selectedChoice;

  @override
  void initState() {
    super.initState();
    _selectedChoice = feedChoice[0]; // Set the default value
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: buildFeedAppBar(theme),
      body: ListView.separated(
        itemCount: FeedData.feeds.length,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          return SingleFeed(feedModel: FeedData.feeds[index]);
        },
      ),
    );
  }

  AppBar buildFeedAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: DropdownButton<String>(
        value: _selectedChoice,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 2,
        style: TextStyle(fontSize: 18.sp, color: theme.colorScheme.onSurface),
        onChanged: (newValue) {
          setState(() {
            _selectedChoice = newValue!;
          });
        },
        items: feedChoice.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
