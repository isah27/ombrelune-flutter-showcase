import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/onboarding_slide.dart';
import '../controllers/onboarding_controller.dart';
import 'onboarding_gif.dart';

class OnboardingSlideView extends StatelessWidget {
  const OnboardingSlideView({
    required this.slide,
    required this.pageIndex,
    super.key,
  });

  final OnboardingSlide slide;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final bool active = context.select<OnboardingController, bool>(
      (OnboardingController c) => c.index == pageIndex,
    );
    final double gifHeight =
        MediaQuery.sizeOf(context).height * AppSizes.gifFlex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        OnboardingGif(asset: slide.gifAsset, height: gifHeight, active: active),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.lg,
            0,
          ),
          child: _SlideCopy(slide: slide),
        ),
      ],
    );
  }
}

class _SlideCopy extends StatelessWidget {
  const _SlideCopy({required this.slide});

  final OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(slide.eyebrow, variant: AppTextVariant.label),
        const SizedBox(height: AppSpacing.sm),
        AppText(slide.title, variant: AppTextVariant.display),
        const SizedBox(height: AppSpacing.sm),
        AppText(slide.subtitle),
      ],
    );
  }
}
