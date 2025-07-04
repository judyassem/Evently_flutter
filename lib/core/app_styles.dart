import 'package:evently/core/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppStyles {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue , secondary: AppColors.white,tertiary: AppColors.grey),
    textTheme: textTheme,
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.pureWhite,
    appBarTheme:AppBarTheme(color: AppColors.pureWhite)
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue , secondary: AppColors.white, tertiary: AppColors.pureWhite),
    textTheme: darkTextTheme,
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.darkBlue,
      appBarTheme:AppBarTheme(color: AppColors.darkBlue)
  );

  static const textTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.grey,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.blue,
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.blue,
    ),
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.blue,
    ),
    labelLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.pureWhite,
    ),
  );
  static const darkTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.blue,
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.blue,
    ),
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.blue,
    ),
    labelLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.pureWhite,
    ),
  );
}
