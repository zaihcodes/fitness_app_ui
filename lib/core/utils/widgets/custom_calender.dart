import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({super.key});

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  // ignore: prefer_final_fields
  PageController _pageController = PageController(
      initialPage: DateTime.now().month - 1); //DateTime.now().month - 1

  DateTime _currentMonth = DateTime.now();
  bool selectedcurrentyear = false;
  List<int> _trainingDays = [1, 3, 5]; // Default training days (Mon, Wed, Fri)
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 350.w,
      child: Column(
        children: [
          _buildHeader(),
          _buildWeeks(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,

              onPageChanged: (index) {
                setState(() {
                  _currentMonth = DateTime(_currentMonth.year, index + 1, 1);
                });
              },
              itemCount: 12 * 10, // Show 10 years, adjust this count as needed
              itemBuilder: (context, pageIndex) {
                DateTime month = DateTime(
                    _currentMonth.year, pageIndex + 1, 1); //(pageIndex % 12)

                return buildCalendar(month, theme: theme);
                // return Container(
                //   color: Colors.red,
                // );
              },
            ),
          ),
        ],
      ),
    );
  }

// Write a Widget code from here
// Widget _buildHeader() {--}
  Widget _buildHeader() {
    // Checks if the current month is the last month of the year (December)
    bool isLastMonthOfYear = _currentMonth.month == 12;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              // Moves to the previous page if the current page index is greater than 0
              if (_pageController.page! > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          // Displays the name of the current month
          Text(
            '${DateFormat('MMMM').format(_currentMonth)}  ${DateTime.now().year}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Moves to the next page if it's not the last month of the year
              if (!isLastMonthOfYear) {
                setState(() {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
          ),
        ],
      ),
    );
  }

//  Widget _buildWeeks() {--}
  Widget _buildWeeks() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildWeekDay('Mon'),
          _buildWeekDay('Tue'),
          _buildWeekDay('Wed'),
          _buildWeekDay('Thu'),
          _buildWeekDay('Fri'),
          _buildWeekDay('Sat'),
          _buildWeekDay('Sun'),
        ],
      ),
    );
  }

  Widget _buildWeekDay(String day) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        day,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

//  Widget _buildCalendar() {--}
// This widget builds the detailed calendar grid for the chosen month.
  Widget buildCalendar(DateTime month, {required ThemeData theme}) {
    // Calculating various details for the month's display
    int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    DateTime firstDayOfMonth = DateTime(month.year, month.month, 1);
    int weekdayOfFirstDay = firstDayOfMonth.weekday;

    DateTime lastDayOfPreviousMonth =
        firstDayOfMonth.subtract(const Duration(days: 1));
    int daysInPreviousMonth = lastDayOfPreviousMonth.day;

    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        // childAspectRatio: 1,
      ),
      // Calculating the total number of cells required in the grid
      itemCount: daysInMonth + weekdayOfFirstDay - 1,
      itemBuilder: (context, index) {
        if (index < weekdayOfFirstDay - 1) {
          // Displaying dates from the previous month in grey
          int previousMonthDay =
              daysInPreviousMonth - (weekdayOfFirstDay - index) + 2;
          return Column(
            children: [
              Text(
                previousMonthDay.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          );
        } else {
          // Displaying the current month's days
          DateTime date =
              DateTime(month.year, month.month, index - weekdayOfFirstDay + 2);
          String text = date.day.toString();
          int weekDay = date.weekday;

          return Container(
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: date.day == DateTime.now().day
                          ? theme.colorScheme.primary
                          : Colors.black),
                ),
                date.isAfter(DateTime.now().add(const Duration(days: -1))) &&
                        _trainingDays.contains(weekDay)
                    ? Expanded(
                        flex: 0,
                        child: SizedBox(
                          child: Icon(
                            Icons.fitness_center,
                            size: 12.w,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          );
        }
      },
    );
  }
}
