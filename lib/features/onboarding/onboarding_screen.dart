import 'package:fitnees_app_ui/features/auth/screens/auth_home_screen.dart';
import 'package:fitnees_app_ui/features/onboarding/model/onboarding_model.dart';
import 'package:fitnees_app_ui/features/onboarding/onboarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                reverse: false,
                itemCount: OnBoardingData.onboardingData.length,
                itemBuilder: (context, index) {
                  final page = OnBoardingData.onboardingData[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: buildPageView(
                        theme: theme,
                        title: page.title,
                        desc: page.description,
                        image: page.imageUrl),
                  );
                }),
            Positioned(
              top: 10,
              right: 0,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const AuthHomeScreen()),
                  // );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthHomeScreen()),
                    (_) => false,
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: theme.colorScheme.tertiary,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          OnBoardingData.onboardingData.length, (index) {
                        return AnimatedContainer(
                          height: 5,
                          width: _currentIndex == index ? 20 : 5,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    _currentIndex < OnBoardingData.onboardingData.length - 1
                        ? buildButton(
                            theme: theme,
                            text: 'NEXT',
                            func: () {
                              if (_currentIndex >= 0 &&
                                  _currentIndex <
                                      OnBoardingData.onboardingData.length) {
                                setState(() {
                                  _currentIndex++;
                                  // _controller.jumpToPage(_currentIndex);
                                  _controller.animateToPage(_currentIndex,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                });
                              }
                            })
                        : buildButton(
                            theme: theme,
                            text: 'BEGIN',
                            func: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const AuthHomeScreen()),
                              // );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AuthHomeScreen()),
                                (_) => false,
                              );
                            }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
