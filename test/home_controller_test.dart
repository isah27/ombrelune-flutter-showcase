import 'package:flutter_test/flutter_test.dart';
import 'package:ombrelune/features/home/domain/entities/product.dart';
import 'package:ombrelune/features/home/domain/entities/product_category.dart';
import 'package:ombrelune/features/home/domain/repositories/product_repository.dart';
import 'package:ombrelune/features/home/presentation/controllers/home_controller.dart';

class _FakeRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async => const <Product>[
    Product(
      id: 'a',
      name: 'Nuit',
      notes: '',
      priceCents: 100,
      imageAsset: '',
      category: ProductCategory.eauDeParfum,
    ),
    Product(
      id: 'b',
      name: 'Candle',
      notes: '',
      priceCents: 100,
      imageAsset: '',
      category: ProductCategory.home,
    ),
  ];
}

void main() {
  test('loads, filters by category and search', () async {
    final HomeController controller = HomeController(
      repository: _FakeRepository(),
    );
    await controller.load();
    expect(controller.products.length, 2);

    controller.selectCategory(ProductCategory.home);
    expect(controller.products.single.id, 'b');

    controller
      ..selectCategory(ProductCategory.all)
      ..search('nu');
    expect(controller.products.single.id, 'a');
  });
}
