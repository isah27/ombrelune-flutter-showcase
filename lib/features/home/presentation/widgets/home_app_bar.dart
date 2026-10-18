import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      backgroundColor: AppColors.obsidian,
      surfaceTintColor: AppColors.transparent,
      centerTitle: true,
      title: Column(
        children: <Widget>[
          AppText(AppStrings.brand, variant: AppTextVariant.headline),
          AppText(AppStrings.maison, variant: AppTextVariant.caption),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: AppSpacing.md),
          child: Icon(Icons.shopping_bag_outlined, color: AppColors.gold),
        ),
      ],
    );
  }
}
