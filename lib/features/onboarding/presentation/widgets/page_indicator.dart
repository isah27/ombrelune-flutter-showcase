import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../controllers/onboarding_controller.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = context.select<OnboardingController, int>(
      (OnboardingController c) => c.index,
    );
    final int count = context.read<OnboardingController>().slides.length;
    return RepaintBoundary(
      child: Row(
        children: List<Widget>.generate(
          count,
          (int i) => _Dot(key: ValueKey<int>(i), active: i == index),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.active, super.key});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.medium,
      curve: Curves.easeOut,
      margin: const EdgeInsets.only(right: AppSpacing.xs),
      height: AppSizes.indicatorDot,
      width: active ? AppSizes.indicatorActive : AppSizes.indicatorDot,
      decoration: BoxDecoration(
        color: active ? AppColors.gold : AppColors.divider,
        borderRadius: AppRadii.button,
      ),
    );
  }
}
