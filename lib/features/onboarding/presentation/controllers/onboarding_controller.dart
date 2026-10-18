import 'package:flutter/foundation.dart';

import '../../domain/entities/onboarding_slide.dart';

class OnboardingController extends ChangeNotifier {
  OnboardingController({required this.slides});

  final List<OnboardingSlide> slides;
  int _index = 0;

  int get index => _index;
  bool get isLast => _index == slides.length - 1;

  void onPageChanged(int value) {
    if (value == _index || value < 0 || value >= slides.length) {
      return;
    }
    _index = value;
    notifyListeners();
  }
}
