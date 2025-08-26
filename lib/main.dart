import 'package:flutter/material.dart';
import 'package:test_flutter/app/application.dart';

import 'app/di/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(Application());
}
