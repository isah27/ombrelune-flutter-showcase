import 'package:flutter/foundation.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_category.dart';
import '../../domain/repositories/product_repository.dart';

class HomeController extends ChangeNotifier {
  HomeController({required this.repository});

  final ProductRepository repository;

  List<Product> _all = const <Product>[];
  List<Product> _visible = const <Product>[];
  ProductCategory _category = ProductCategory.all;
  String _query = '';
  bool _loading = false;

  bool get loading => _loading;
  ProductCategory get category => _category;
  List<Product> get products => _visible;
  Product? get featured => _all.isEmpty ? null : _all.first;

  Future<void> load() async {
    _loading = true;
    notifyListeners();
    _all = await repository.fetchProducts();
    _loading = false;
    _apply();
  }

  void selectCategory(ProductCategory value) {
    if (value == _category) {
      return;
    }
    _category = value;
    _apply();
  }

  void search(String value) {
    _query = value.trim().toLowerCase();
    _apply();
  }

  void _apply() {
    _visible = List<Product>.unmodifiable(
      _all.where(
        (Product p) =>
            (_category == ProductCategory.all || p.category == _category) &&
            (_query.isEmpty || p.name.toLowerCase().contains(_query)),
      ),
    );
    notifyListeners();
  }
}
