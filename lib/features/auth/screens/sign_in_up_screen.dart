import 'package:fitnees_app_ui/features/auth/screens/sign_in_screen.dart';
import 'package:fitnees_app_ui/features/auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignInUpScreen extends StatelessWidget {
  const SignInUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Sign up or Sign in',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          bottom: const TabBar(
            padding: EdgeInsets.only(top: 20),
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            tabs: [
              Tab(
                text: 'Sign up',
              ),
              Tab(
                text: 'Sign in',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SignUpScreen(),
            SignInScreen(),
          ],
        ),
      ),
    );
  }
}
