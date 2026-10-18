import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/image_cache_size.dart';

/// Looping product film. Ticker is muted when the page is off-screen so the
/// GIF stops decoding frames, and it paints on its own layer.
class OnboardingGif extends StatelessWidget {
  const OnboardingGif({
    required this.asset,
    required this.height,
    required this.active,
    super.key,
  });

  final String asset;
  final double height;
  final bool active;

  static const List<Color> _fade = <Color>[
    AppColors.transparent,
    AppColors.obsidian,
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return RepaintBoundary(
      child: TickerMode(
        enabled: active,
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                asset,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                cacheWidth: ImageCacheSize.forExtent(context, width),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: _fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
