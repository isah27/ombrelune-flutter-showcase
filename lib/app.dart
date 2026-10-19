import 'core/theme/app_theme.dart';
import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';
import 'core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_strings.dart';
import 'features/home/presentation/controllers/home_controller.dart';
import 'features/onboarding/presentation/controllers/onboarding_controller.dart';

class OmbreluneApp extends StatelessWidget {
  const OmbreluneApp({required this.locator, super.key});

  final ServiceLocator locator;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider<ChangeNotifier>>[
        ChangeNotifierProvider<OnboardingController>(
          create: (_) => OnboardingController(
            slides: locator.onboardingRepository.slides(),
          ),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (_) =>
              HomeController(repository: locator.productRepository)..load(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.brand,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        initialRoute: AppRoutes.onboarding,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
