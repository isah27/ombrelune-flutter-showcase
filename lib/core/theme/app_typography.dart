import 'package:flutter/painting.dart';

import 'app_colors.dart';

abstract final class AppTypography {
  static const String _serif = 'serif';

  static const TextStyle display = TextStyle(
    fontFamily: _serif,
    fontSize: 34,
    height: 1.15,
    letterSpacing: 0.5,
    color: AppColors.ivory,
  );
  static const TextStyle headline = TextStyle(
    fontFamily: _serif,
    fontSize: 24,
    height: 1.2,
    color: AppColors.ivory,
  );
  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.ivory,
  );
  static const TextStyle body = TextStyle(
    fontSize: 15,
    height: 1.5,
    color: AppColors.mist,
  );
  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.4,
    color: AppColors.gold,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    letterSpacing: 0.4,
    color: AppColors.mist,
  );
}
