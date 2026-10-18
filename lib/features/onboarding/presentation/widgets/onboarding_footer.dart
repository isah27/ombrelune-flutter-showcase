import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../controllers/onboarding_controller.dart';
import 'page_indicator.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({required this.onNext, super.key});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final bool isLast = context.select<OnboardingController, bool>(
      (OnboardingController c) => c.isLast,
    );
    return SafeArea(
      minimum: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: <Widget>[
          const PageIndicator(),
          const Spacer(),
          AppButton(
            label: isLast ? AppStrings.getStarted : AppStrings.next,
            onPressed: onNext,
            expanded: false,
          ),
        ],
      ),
    );
  }
}
