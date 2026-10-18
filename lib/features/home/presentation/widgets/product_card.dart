import 'package:flutter/material.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/image_cache_size.dart';
import '../../../../core/utils/price_formatter.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({required this.product, super.key});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _pressed = false;

  void _setPressed(bool value) => setState(() => _pressed = value);

  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;
    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapCancel: () => _setPressed(false),
      onTapUp: (_) => _setPressed(false),
      onTap: () =>
          Navigator.of(context)
              .pushNamed(AppRoutes.productDetail, arguments: product),
      child: AnimatedScale(
        scale: _pressed ? AppSizes.pressedScale : 1,
        duration: AppDurations.fast,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppRadii.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _CardImage(product: product),
              _CardInfo(product: product),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => ClipRRect(
        borderRadius: AppRadii.card,
        child: AspectRatio(
          aspectRatio: AppSizes.cardImageAspect,
          child: Hero(
            tag: product.id,
            child: Image.asset(
              product.imageAsset,
              fit: BoxFit.cover,
              cacheWidth: ImageCacheSize.forExtent(
                context,
                constraints.maxWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  const _CardInfo({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText(product.name, variant: AppTextVariant.title, maxLines: 1),
          const SizedBox(height: AppSpacing.xxs),
          AppText(product.notes, variant: AppTextVariant.caption, maxLines: 1),
          const SizedBox(height: AppSpacing.xs),
          AppText(
            PriceFormatter.usd(product.priceCents),
            color: AppColors.gold,
          ),
        ],
      ),
    );
  }
}
