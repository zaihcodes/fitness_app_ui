import 'package:fitnees_app_ui/core/utils/widgets/custom_button.dart';
import 'package:fitnees_app_ui/features/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/enums/custom_enums.dart';

// enum Gender { male, female }

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({super.key});

  @override
  State<SignUpScreen1> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  bool _showPassword = false;
  Gender? _selectedGender;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      color: Colors.amber,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        // scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 20.h,
          ),
          // Custom TextField
          CustomTextField(
            label: 'First Name',
            hintText: 'First Name',
            onChange: (value) {
              debugPrint('First Name: $value');
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          // Custom TextField
          CustomTextField(
            label: 'Last Name',
            hintText: 'Last Name',
            onChange: (value) {
              debugPrint('Last Name: $value');
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          // Custom TextField
          CustomTextField(
            label: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
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
            height: 15.h,
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<Gender>(
                  title: const Text('Male'),
                  value: Gender.men,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<Gender>(
                  title: const Text('Female'),
                  value: Gender.women,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              'By Carrying on using Gigafit, you agree to accept.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 0.1,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'user agreement',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              Text(
                'and',
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Privacy policy',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomButton(
            text: "SIGN UP",
            func: () {},
            bgColor: theme.colorScheme.primary,
            textColor: theme.colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _showPassword = false;
  Gender? _selectedGender;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          // scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 20.h,
            ),
            // Custom TextField
            CustomTextField(
              label: 'First Name',
              hintText: 'First Name',
              onChange: (value) {
                debugPrint('First Name: $value');
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            // Custom TextField
            CustomTextField(
              label: 'Last Name',
              hintText: 'Last Name',
              onChange: (value) {
                debugPrint('Last Name: $value');
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            // Custom TextField
            CustomTextField(
              label: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
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
              height: 15.h,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<Gender>(
                    title: const Text('Male'),
                    value: Gender.men,
                    groupValue: _selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<Gender>(
                    title: const Text('Female'),
                    value: Gender.women,
                    groupValue: _selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            // const Spacer(),
            SizedBox(
              height: size.height * 0.1.h,
            ),
            Center(
              child: Text(
                'By Carrying on using Gigafit, you agree to accept.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 0.1,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'user agreement',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                Text(
                  'and',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Privacy policy',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomButton(
              text: "SIGN UP",
              func: () {},
              bgColor: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
