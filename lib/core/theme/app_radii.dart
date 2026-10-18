import 'package:flutter/painting.dart';

abstract final class AppRadii {
  static const Radius small = Radius.circular(10);
  static const Radius medium = Radius.circular(18);
  static const Radius pill = Radius.circular(100);
  static const BorderRadius card = BorderRadius.all(medium);
  static const BorderRadius field = BorderRadius.all(small);
  static const BorderRadius button = BorderRadius.all(pill);
}
