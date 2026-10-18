import 'package:flutter/foundation.dart';

@immutable
class OnboardingSlide {
  const OnboardingSlide({
    required this.gifAsset,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  final String gifAsset;
  final String eyebrow;
  final String title;
  final String subtitle;
}
