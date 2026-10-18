import '../../features/home/data/repositories/local_product_repository.dart';
import '../../features/home/domain/repositories/product_repository.dart';
import '../../features/onboarding/data/repositories/local_onboarding_repository.dart';
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';

/// Tiny, dependency-free composition root. Swap implementations here.
class ServiceLocator {
  const ServiceLocator._({
    required this.productRepository,
    required this.onboardingRepository,
  });

  factory ServiceLocator.setup() => const ServiceLocator._(
    productRepository: LocalProductRepository(),
    onboardingRepository: LocalOnboardingRepository(),
  );

  final ProductRepository productRepository;
  final OnboardingRepository onboardingRepository;
}
