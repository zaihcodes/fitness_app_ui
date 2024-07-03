import 'package:fitnees_app_ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.greenAccent,
              brightness: Brightness.light,
            ),
            useMaterial3: true),
        // home: const OnBoardingScreen()
        home: const MainScreen(),
      ),
    );
  }
}
