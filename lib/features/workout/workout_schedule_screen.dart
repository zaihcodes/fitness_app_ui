import 'package:fitnees_app_ui/core/constants/app_spacing.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_app_bar.dart';
import 'package:fitnees_app_ui/core/utils/widgets/custom_calender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutScheduleScreen extends StatefulWidget {
  const WorkoutScheduleScreen({super.key});

  @override
  State<WorkoutScheduleScreen> createState() => _WorkoutScheduleScreenState();
}

class _WorkoutScheduleScreenState extends State<WorkoutScheduleScreen> {
  bool showOnDashboard = true;
  bool displayAllProgramData = false;
  bool autoWorkoutPosition = true;
  List<int> trainingDays = [1, 3, 5, 7];
  final String day = 'Mon';
  final List<String> weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: CustomAppBar(title: 'Workout schedule', theme: theme),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSpacing.small,
              ),
              CustomCalender(
                trainingDays: trainingDays,
              ),
              SizedBox(
                height: AppSpacing.medium,
              ),
              buildTitleWithSwitch(
                  theme: theme,
                  title: 'Show on Dashboard',
                  switchValue: showOnDashboard,
                  onChanged: (value) {
                    setState(() {
                      showOnDashboard = value;
                    });
                  }),
              SizedBox(
                height: AppSpacing.medium,
              ),
              buildTitleWithSwitch(
                  theme: theme,
                  title: 'Display all of the data from all workout programs',
                  switchValue: displayAllProgramData,
                  onChanged: (value) {
                    setState(() {
                      displayAllProgramData = value;
                    });
                  }),
              SizedBox(
                height: AppSpacing.medium,
              ),
              buildTitleWithSwitch(
                  theme: theme,
                  title: 'Automatic workout positioning',
                  switchValue: autoWorkoutPosition,
                  onChanged: (value) {
                    setState(() {
                      autoWorkoutPosition = value;
                      if (!value) {
                        trainingDays = [1, 3, 5, 7];
                      }
                    });
                  }),
              SizedBox(
                height: AppSpacing.medium,
              ),
              Text(
                'Select your workout days',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: autoWorkoutPosition
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.primary,
                ),
              ),
              SizedBox(
                height: AppSpacing.small,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(weekDays.length, (index) {
                  final day = weekDays[index];
                  final dayIndex = index + 1;
                  return buildWorkDaySelect(
                      theme: theme,
                      day: day,
                      dayIndex: dayIndex,
                      onTap: () {
                        setState(() {
                          if (trainingDays.contains(dayIndex)) {
                            trainingDays.remove(dayIndex);
                            if (trainingDays.isEmpty) {
                              trainingDays = [1, 3, 5, 7];
                            }
                          } else {
                            trainingDays.add(dayIndex);
                          }
                        });
                      });
                }),
              ),
              SizedBox(
                height: AppSpacing.small,
              ),
              autoWorkoutPosition
                  ? Text(
                      'Training days are set in the calendar automatically, taking into account tje recommendation and the chosen goal. In the event of skipping a training session or its completion befor the due date, the schedule is recalculated automatically',
                      style: TextStyle(fontSize: 14.sp),
                    )
                  : Text(
                      'The highlighted days will be displayed in the calendar',
                      style: TextStyle(fontSize: 14.sp),
                    ),
              SizedBox(
                height: AppSpacing.small,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildWorkDaySelect({
    required ThemeData theme,
    required String day,
    required int dayIndex,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: trainingDays.contains(dayIndex) && !autoWorkoutPosition
              ? theme.colorScheme.primary
              : theme.colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(50),
          boxShadow: autoWorkoutPosition
              ? []
              : [
                  BoxShadow(
                    color: theme.colorScheme.shadow.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 3),
                  )
                ],
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: trainingDays.contains(dayIndex) && !autoWorkoutPosition
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onTertiaryContainer,
            ),
          ),
        ),
      ),
    );
  }

  Row buildTitleWithSwitch(
      {required ThemeData theme,
      required String title,
      required bool switchValue,
      required void Function(bool)? onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
          ),
        ),
        CupertinoSwitch(
          value: switchValue,
          activeColor: theme.colorScheme.primary,
          trackColor: theme.colorScheme.onSurface.withOpacity(0.5),
          // thumbColor: Colors.greenAccent,

          onChanged: onChanged,
        )
      ],
    );
  }
}
