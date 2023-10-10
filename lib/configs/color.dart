import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class AppColors {
  static const Color serenity = Color(0xFF92A8D1);
  static const Color roseQuartz = Color(0xFFF7CAC9);
  static const Color deepEbony = Color(0xFF615E5F);
  static const Color aomaCyan = Color(0xFF519ABA);
  static const Color curryYellow = Color(0xFFABA519);
  static const Color jennyRed = Color(0xFFBA519A);

  static const defaultGradient = LinearGradient(
    colors: [
      AppColors.serenity,
      AppColors.roseQuartz,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 1],
    transform: GradientRotation(math.pi),
  );

  /// https://drawcall.github.io/c2f/
  static const defaultBoxDecoration = BoxDecoration(
    gradient: defaultGradient,
  );

  static BoxDecoration disableGradient = BoxDecoration(
    color: deepEbony.withAlpha(89),
  );
  static const colorDict = [
    AppColors.aomaCyan,
    AppColors.curryYellow,
    AppColors.jennyRed,
  ];

  static Color getColorByString(String seed) {
    if (seed.isEmpty) {
      return colorDict.first;
    }
    return colorDict[seed.characters
            .map(
              (e) => e.codeUnits.reduce((a, b) => a + b),
            )
            .reduce((a, b) => a + b) %
        colorDict.length];
  }

  static void setupStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        // Color for Android
        statusBarColor: AppColors.serenity,
        // Dark == white status bar -- for IOS.
        statusBarBrightness: Brightness.light,
      ),
    );
  }
}
