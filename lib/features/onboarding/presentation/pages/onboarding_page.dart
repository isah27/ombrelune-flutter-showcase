import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_durations.dart';
import '../../domain/entities/onboarding_slide.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_footer.dart';
import '../widgets/onboarding_slide_view.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  bool _precached = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_precached) {
      return;
    }
    _precached = true;
    final List<OnboardingSlide> slides = context
        .read<OnboardingController>()
        .slides;
    for (final OnboardingSlide slide in slides) {
      precacheImage(AssetImage(slide.gifAsset), context);
    }
    precacheImage(AssetImage(AppAssets.product(1)), context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next() {
    final OnboardingController controller = context
        .read<OnboardingController>();
    if (controller.isLast) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      return;
    }
    _pageController.nextPage(
      duration: AppDurations.page,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingSlide> slides = context
        .read<OnboardingController>()
        .slides;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            onPageChanged: context.read<OnboardingController>().onPageChanged,
            itemBuilder: (_, int i) => OnboardingSlideView(
              key: ValueKey<String>(slides[i].gifAsset),
              slide: slides[i],
              pageIndex: i,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: OnboardingFooter(onNext: _next),
          ),
        ],
      ),
    );
  }
}
