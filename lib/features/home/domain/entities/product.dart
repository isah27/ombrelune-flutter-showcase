import 'package:flutter/foundation.dart';

import 'product_category.dart';

@immutable
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.notes,
    required this.priceCents,
    required this.imageAsset,
    required this.category,
  });

  final String id;
  final String name;
  final String notes;
  final int priceCents;
  final String imageAsset;
  final ProductCategory category;
}
