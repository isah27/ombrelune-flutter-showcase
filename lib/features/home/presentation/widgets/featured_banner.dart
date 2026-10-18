import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/image_cache_size.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product.dart';
import '../controllers/home_controller.dart';

class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({super.key});

  static const List<Color> _scrim = <Color>[
    AppColors.scrim,
    AppColors.transparent,
  ];

  @override
  Widget build(BuildContext context) {
    final Product? featured = context.select<HomeController, Product?>(
      (HomeController c) => c.featured,
    );
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: ClipRRect(
        borderRadius: AppRadii.card,
        child: SizedBox(
          height: AppSizes.bannerHeight,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              const ColoredBox(color: AppColors.surface),
              if (featured != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    featured.imageAsset,
                    fit: BoxFit.cover,
                    cacheHeight: ImageCacheSize.forExtent(
                      context,
                      AppSizes.bannerHeight,
                    ),
                  ),
                ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: _scrim),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText(
                      AppStrings.featuredEyebrow,
                      variant: AppTextVariant.label,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    AppText(
                      AppStrings.featuredTitle,
                      variant: AppTextVariant.headline,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
