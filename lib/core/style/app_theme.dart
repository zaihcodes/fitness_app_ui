import 'package:flutter/material.dart';

class AppTheme {
  // Define your primary color
  static const Color primaryColor = Color(0xFF7EC44E);

  // Generate other colors based on the primary color
  static final Color primaryVariantColor = _darken(primaryColor, 0.2);
  static final Color secondaryColor = _lighten(primaryColor, 0.3);
  static final Color secondaryVariantColor = _darken(secondaryColor, 0.2);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFB00020);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);
  static const Color onSecondaryColor = Color(0xFF000000);
  static const Color onBackgroundColor = Color(0xFF000000);
  static const Color onSurfaceColor = Color(0xFF000000);
  static const Color onErrorColor = Color(0xFFFFFFFF);

  // Define your custom text styles
  static const TextStyle headline1 = TextStyle(
    // fontFamily: 'Roboto',
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: onBackgroundColor,
  );

  static const TextStyle headline2 = TextStyle(
    // fontFamily: 'Roboto',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: onBackgroundColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    // fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: onBackgroundColor,
  );

  static const TextStyle bodyText2 = TextStyle(
    // fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: onBackgroundColor,
  );

  // Define the light theme
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: primaryColor,
      primaryContainer: primaryVariantColor,
      secondary: secondaryColor,
      secondaryContainer: secondaryVariantColor,
      surface: surfaceColor,
      // background: backgroundColor,
      error: errorColor,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onSurface: onSurfaceColor,
      // onBackground: onBackgroundColor,
      onError: onErrorColor,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      headlineLarge: headline1,
      headlineMedium: headline2,
      bodyLarge: bodyText1,
      bodyMedium: bodyText2,
    ),
  );

  // Helper method to darken a color
  static Color _darken(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  // Helper method to lighten a color
  static Color _lighten(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
