import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  // Tema Claro
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarLight,
      elevation: 2,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.buttonText,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  // Tema Escuro
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark, // Fundo escuro mais claro
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDarkSecondary),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarDark, // Mantendo o vermelho vibrante para identidade
      elevation: 2,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.buttonText,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
