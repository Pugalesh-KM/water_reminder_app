import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.light(
      primary: AppColors.secondary,
      secondary: AppColors.primary,
      background: AppColors.black,
      error: AppColors.error,
      surface: AppColors.secondary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
    textTheme: _buildTextTheme(Brightness.light),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: AppTextStyles.openSansBold14,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      filled: true,
      fillColor: AppColors.surface,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondary,
      error: AppColors.error,
      background: AppColors.white,
      surface: AppColors.secondaryDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: _buildTextTheme(Brightness.dark),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: AppTextStyles.openSansBold14,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      filled: true,
      fillColor: AppColors.darkGrey,
    ),
  );

  static TextTheme _buildTextTheme(Brightness brightness) {
    return brightness == Brightness.light
        ? const TextTheme(
      titleLarge: AppTextStyles.openSansBold24,
      titleMedium: AppTextStyles.openSansBold20,
      bodyLarge: AppTextStyles.openSansRegular16,
      bodyMedium: AppTextStyles.openSansRegular14,
      bodySmall: AppTextStyles.openSansRegular12,
    )
        : const TextTheme(
      titleLarge: AppTextStyles.openSansBold24,
      titleMedium: AppTextStyles.openSansBold20,
      bodyLarge: AppTextStyles.openSansRegular16,
      bodyMedium: AppTextStyles.openSansRegular14,
      bodySmall: AppTextStyles.openSansRegular12,
    );
  }
}
