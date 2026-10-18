import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../controllers/home_controller.dart';
import '../widgets/category_chips.dart';
import '../widgets/featured_banner.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/product_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const HomeAppBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: SliverToBoxAdapter(
              child: AppTextField(
                hint: AppStrings.search,
                prefixIcon: Icons.search,
                onChanged: context.read<HomeController>().search,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: FeaturedBanner()),
          const SliverToBoxAdapter(child: CategoryChips()),
          const ProductGrid(),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
        ],
      ),
    );
  }
}
