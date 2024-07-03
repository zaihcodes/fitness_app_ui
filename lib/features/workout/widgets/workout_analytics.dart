import 'package:fitnees_app_ui/features/workout/data/chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/utils/widgets/custom_section_title.dart';
import '../model/chart_data_model.dart';

class WorkoutAnalytics extends StatefulWidget {
  const WorkoutAnalytics({super.key});

  @override
  State<WorkoutAnalytics> createState() => _WorkoutAnalyticsState();
}

class _WorkoutAnalyticsState extends State<WorkoutAnalytics> {
  final List<String> _analyticsFilter = [
    'Last',
    'Week',
    'Month',
    'All time',
  ];
  final List<List<ChartDataModel>> _analyticsPeriodData = [
    ChartData.lastData,
    ChartData.weekData,
    ChartData.monthData,
    ChartData.allTimeData,
  ];
  int _selectedFilterIndex = 0;
  late List<ChartDataModel> _chartPeiData;

  @override
  void initState() {
    super.initState();
    _chartPeiData = _analyticsPeriodData[_selectedFilterIndex];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const CustomSectionTitle(
          title: 'Distribution by type of exercise',
        ),
        SizedBox(
          height: AppSpacing.medium,
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _analyticsFilter.length,
              itemBuilder: (context, index) {
                return analyticsFilterItem(
                    index: index,
                    theme: theme,
                    menuItem: _analyticsFilter[index]);
              }),
        ),
        SizedBox(height: AppSpacing.large),
        Container(
          height: 240.h,
          padding: EdgeInsets.symmetric(vertical: 40),
          child: PieChart(
            PieChartData(
                sections: List.generate(_chartPeiData.length, (index) {
              final data = _chartPeiData[index];
              return customPieChart(
                  value: data.percent,
                  color: data.color,
                  title: '${data.percent}%');
            })),
          ),
        ),
        SizedBox(height: AppSpacing.large),
        Wrap(
          spacing: 5,
          runSpacing: 0,
          children: _chartPeiData.map((chartData) {
            return buildLegendItem(
              theme: theme,
              color: chartData.color,
              title: chartData.title,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildLegendItem(
      {required ThemeData theme, required Color color, required String title}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(
              color: theme.colorScheme.primary, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  PieChartSectionData customPieChart({
    double? value,
    Color? color,
    bool? showTitle,
    String? title,
  }) {
    return PieChartSectionData(
        value: value,
        color: color,
        radius: 70,
        titlePositionPercentageOffset: 1.3,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        badgePositionPercentageOffset: 1.35,
        badgeWidget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ));
  }

  GestureDetector analyticsFilterItem({
    required int index,
    required ThemeData theme,
    required String menuItem,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilterIndex = index;
          _chartPeiData = _analyticsPeriodData[_selectedFilterIndex];
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: _selectedFilterIndex == index
              ? theme.colorScheme.primary
              : theme.colorScheme.tertiaryContainer,
        ),
        child: Text(
          menuItem,
          style: TextStyle(
            color: _selectedFilterIndex == index
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onTertiaryContainer,
          ),
        ),
      ),
    );
  }
}
