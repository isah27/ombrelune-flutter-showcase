import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/image_cache_size.dart';
import '../../../../core/utils/price_formatter.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Hero(
            tag: product.id,
            child: Image.asset(
              product.imageAsset,
              fit: BoxFit.cover,
              width: width,
              cacheWidth: ImageCacheSize.forExtent(context, width),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText(
                  product.notes.toUpperCase(),
                  variant: AppTextVariant.label,
                ),
                const SizedBox(height: AppSpacing.xs),
                AppText(product.name, variant: AppTextVariant.display),
                const SizedBox(height: AppSpacing.xs),
                AppText(
                  PriceFormatter.usd(product.priceCents),
                  variant: AppTextVariant.headline,
                ),
                const SizedBox(height: AppSpacing.xl),
                AppButton(label: AppStrings.addToBag, onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
