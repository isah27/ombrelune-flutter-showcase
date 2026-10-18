import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_durations.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_category.dart';
import '../../domain/repositories/product_repository.dart';

class LocalProductRepository implements ProductRepository {
  const LocalProductRepository();

  @override
  Future<List<Product>> fetchProducts() async {
    await Future<void>.delayed(AppDurations.network);
    return <Product>[
      Product(
        id: 'nuit-ambree',
        name: 'Nuit Ambrée',
        notes: 'Amber · Oud · Saffron',
        priceCents: 24000,
        imageAsset: AppAssets.product(1),
        category: ProductCategory.eauDeParfum,
      ),
      Product(
        id: 'rose-noire',
        name: 'Rose Noire',
        notes: 'Black rose · Musk',
        priceCents: 21000,
        imageAsset: AppAssets.product(2),
        category: ProductCategory.eauDeParfum,
      ),
      Product(
        id: 'oud-fume',
        name: 'Oud Fumé',
        notes: 'Smoked oud · Leather',
        priceCents: 28000,
        imageAsset: AppAssets.product(3),
        category: ProductCategory.eauDeParfum,
      ),
      Product(
        id: 'lune-argent',
        name: 'Lune d\'Argent',
        notes: 'Iris · Bergamot',
        priceCents: 19500,
        imageAsset: AppAssets.product(4),
        category: ProductCategory.eauDeParfum,
      ),
      Product(
        id: 'santal-oil',
        name: 'Santal Elixir',
        notes: 'Sandalwood · Vanilla',
        priceCents: 14500,
        imageAsset: AppAssets.product(5),
        category: ProductCategory.oils,
      ),
      Product(
        id: 'veille-candle',
        name: 'La Veille Candle',
        notes: 'Amber · Cedar',
        priceCents: 9500,
        imageAsset: AppAssets.product(6),
        category: ProductCategory.home,
      ),
      Product(
        id: 'voyage',
        name: 'Voyage Atomiser',
        notes: 'Refillable · 10 ml',
        priceCents: 12000,
        imageAsset: AppAssets.product(7),
        category: ProductCategory.sets,
      ),
      Product(
        id: 'discovery',
        name: 'Discovery Coffret',
        notes: 'Five 5 ml vials',
        priceCents: 6500,
        imageAsset: AppAssets.product(8),
        category: ProductCategory.sets,
      ),
    ];
  }
}
