import '../../../../core/constants/app_assets.dart';
import '../../domain/entities/onboarding_slide.dart';
import '../../domain/repositories/onboarding_repository.dart';

class LocalOnboardingRepository implements OnboardingRepository {
  const LocalOnboardingRepository();

  @override
  List<OnboardingSlide> slides() => const <OnboardingSlide>[
    OnboardingSlide(
      gifAsset: AppAssets.onboarding1,
      eyebrow: 'I · THE FLACON',
      title: 'Cut like smoked amber.',
      subtitle: 'Hand-faceted glass, crowned in brushed champagne gold.',
    ),
    OnboardingSlide(
      gifAsset: AppAssets.onboarding2,
      eyebrow: 'II · THE ESSENCE',
      title: 'Liquid light, slowly poured.',
      subtitle: 'Rare oud, black rose and vanilla, aged for 120 days.',
    ),
    OnboardingSlide(
      gifAsset: AppAssets.onboarding3,
      eyebrow: 'III · THE RITUAL',
      title: 'Wear the hour after midnight.',
      subtitle: 'A scent that settles close and lingers until dawn.',
    ),
  ];
}
