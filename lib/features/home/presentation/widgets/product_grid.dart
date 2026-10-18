import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product.dart';
import '../controllers/home_controller.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final bool loading = context.select<HomeController, bool>(
      (HomeController c) => c.loading,
    );
    final List<Product> products = context
        .select<HomeController, List<Product>>(
          (HomeController c) => c.products,
        );
    if (loading) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xxl),
          child: Center(
            child: CircularProgressIndicator(color: AppColors.gold),
          ),
        ),
      );
    }
    if (products.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xxl),
          child: AppText(AppStrings.empty, textAlign: TextAlign.center),
        ),
      );
    }
    return SliverPadding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppSizes.gridColumns,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          childAspectRatio: AppSizes.gridAspect,
        ),
        itemCount: products.length,
        itemBuilder: (_, int i) => ProductCard(
          key: ValueKey<String>(products[i].id),
          product: products[i],
        ),
      ),
    );
  }
}
