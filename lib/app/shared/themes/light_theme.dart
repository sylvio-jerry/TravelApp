import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: AppColor.white,
    primary: AppColor.primaryLight,
    secondary: AppColor.secondaryLight,
    error: AppColor.errorColor,
  ),
  scaffoldBackgroundColor: AppColor.bodyColorLight,
  hintColor: AppColor.hintStyleColor,
  primaryColorLight: AppColor.primaryLight,
  primaryIconTheme: IconThemeData(
    color: AppColor.textColorLight,
  ),
  iconTheme: IconThemeData(
    color: AppColor.textColorLight,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 32,
    ),
    headlineLarge: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    headlineSmall: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    bodyLarge: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 16,
      fontFamily: 'Roboto',
    ),
    bodyMedium: TextStyle(
        color: AppColor.textColorLight,
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 12,
      fontFamily: 'Roboto',
    ),
  ),
  buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal, buttonColor: Colors.white),
);
