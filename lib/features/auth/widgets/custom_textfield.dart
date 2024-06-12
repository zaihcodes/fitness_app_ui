import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.label,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.isobscureText = false,
      this.showPassword = false,
      required this.onChange,
      this.togglePassword,
      super.key});

  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String) onChange;
  final bool isobscureText;
  final bool showPassword;
  final VoidCallback? togglePassword;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextField(
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.5)),
            suffixIcon: isobscureText
                ? GestureDetector(
                    onTap: togglePassword,
                    child: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
                  )
                : null,
          ),
          keyboardType: keyboardType,
          obscureText: showPassword ? false : true,
        )
      ],
    );
  }
}
