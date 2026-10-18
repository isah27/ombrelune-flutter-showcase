import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final ServiceLocator locator = ServiceLocator.setup();
  runApp(OmbreluneApp(locator: locator));
}
