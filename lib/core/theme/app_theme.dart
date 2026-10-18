import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.obsidian,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.gold,
      onPrimary: AppColors.obsidian,
      secondary: AppColors.goldDeep,
      surface: AppColors.surface,
      onSurface: AppColors.ivory,
    ),
    textTheme: const TextTheme(
      displaySmall: AppTypography.display,
      headlineSmall: AppTypography.headline,
      titleMedium: AppTypography.title,
      bodyMedium: AppTypography.body,
      labelLarge: AppTypography.label,
      bodySmall: AppTypography.caption,
    ),
    dividerColor: AppColors.divider,
    splashFactory: InkSparkle.splashFactory,
  );
}
