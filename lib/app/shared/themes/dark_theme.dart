import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: AppColor.black.withOpacity(.3),
      primary: AppColor.primaryDark,
      secondary: AppColor.secondaryDark,
      error: AppColor.errorColor,
    ),
    scaffoldBackgroundColor: AppColor.bodyColorDark,
    hintColor: AppColor.hintStyleColor,
    primaryColorDark: AppColor.primaryDark,
    primaryIconTheme: IconThemeData(
      color: AppColor.textColorDark,
    ),
    iconTheme: IconThemeData(
      color: AppColor.textColorDark,
    ),
    textTheme: TextTheme(
    displayLarge: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 32,
    ),
    headlineLarge: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: AppColor.textColorDark,
      fontSize: 12,
    ),
  ),
    buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.white));
