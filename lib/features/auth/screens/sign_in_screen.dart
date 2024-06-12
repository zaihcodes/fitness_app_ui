import 'package:fitnees_app_ui/core/utils/widgets/custom_button.dart';
import 'package:fitnees_app_ui/features/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      // height: double.infinity,
      child: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            // Custom TextField
            CustomTextField(
              label: 'Email',
              hintText: 'Enter your email',
              onChange: (value) {
                debugPrint('Email: $value');
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            // Custom TextField
            CustomTextField(
              label: 'Password',
              hintText: 'Enter your password',
              onChange: (value) {
                debugPrint('password: $value');
              },
              isobscureText: true,
              showPassword: _showPassword,
              togglePassword: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
            ),
            // const Spacer(),
            SizedBox(height: 20.h ,),
            CustomButton(
              text: "SIGN IN",
              func: () {},
              bgColor: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
            )
          ],
        ),
      ),
    );
  }
}
