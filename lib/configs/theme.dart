import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacher/configs/color.dart';

TextTheme defaultText = TextTheme(
  displayLarge: GoogleFonts.notoSans(
    fontSize: 57,
    color: AppColors.deepEbony,
  ),
  displayMedium: GoogleFonts.notoSans(
    fontSize: 45,
    color: AppColors.deepEbony,
  ),
  displaySmall: GoogleFonts.notoSans(
    fontSize: 36,
    color: AppColors.deepEbony,
  ),
  headlineLarge: GoogleFonts.notoSans(
    fontSize: 32,
  ),
  headlineMedium: GoogleFonts.notoSans(
    fontSize: 28,
  ),
  headlineSmall: GoogleFonts.notoSans(
    fontSize: 24,
    color: AppColors.deepEbony,
  ),
  titleLarge: GoogleFonts.notoSans(
    fontSize: 22,
    color: AppColors.deepEbony,
  ),
  titleMedium: GoogleFonts.notoSans(
    fontSize: 16,
    color: AppColors.deepEbony,
  ),
  titleSmall: GoogleFonts.notoSans(
    fontSize: 14,
    color: AppColors.deepEbony,
  ),
  labelLarge: GoogleFonts.notoSans(
    fontSize: 14,
    color: AppColors.deepEbony,
  ),
  labelMedium: GoogleFonts.notoSans(
    fontSize: 12,
    color: AppColors.deepEbony,
  ),
  labelSmall: GoogleFonts.notoSans(
    fontSize: 11,
    color: AppColors.deepEbony,
  ),
  bodyLarge: GoogleFonts.notoSans(
    fontSize: 16,
    color: AppColors.deepEbony,
  ),
  bodyMedium: GoogleFonts.notoSans(
    fontSize: 14,
    color: AppColors.deepEbony,
  ),
  bodySmall: GoogleFonts.notoSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.deepEbony,
  ),
);

ThemeData defaultThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.serenity,
    primary: AppColors.serenity,
    secondary: AppColors.deepEbony,
  ),
  useMaterial3: true,
  textTheme: defaultText,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black87),
    titleTextStyle: TextStyle(color: Colors.black87),
    scrolledUnderElevation: 0,
    shadowColor: Colors.transparent,
  ),
  scaffoldBackgroundColor: Colors.white,
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  canvasColor: Colors.transparent,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
      minimumSize: Size.zero,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: const BorderSide(
        width: 1.0,
        color: AppColors.serenity,
      ),
      textStyle: defaultText.bodyLarge!.copyWith(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
