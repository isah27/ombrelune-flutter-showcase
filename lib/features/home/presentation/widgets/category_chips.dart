import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product_category.dart';
import '../controllers/home_controller.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductCategory selected = context
        .select<HomeController, ProductCategory>(
          (HomeController c) => c.category,
        );
    return SizedBox(
      height: AppSizes.chipHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: ProductCategory.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.xs),
        itemBuilder: (_, int i) {
          final ProductCategory category = ProductCategory.values[i];
          return _CategoryChip(
            key: ValueKey<ProductCategory>(category),
            category: category,
            selected: category == selected,
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.category,
    required this.selected,
    super.key,
  });

  final ProductCategory category;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: AppText(
        category.label,
        variant: AppTextVariant.caption,
        color: selected ? AppColors.obsidian : AppColors.ivory,
      ),
      selected: selected,
      showCheckmark: false,
      selectedColor: AppColors.gold,
      backgroundColor: AppColors.surface,
      side: const BorderSide(color: AppColors.divider),
      onSelected: (_) =>
          context.read<HomeController>().selectCategory(category),
    );
  }
}
