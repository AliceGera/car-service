import 'dart:async';

import 'package:car_service/features/app/di/app_scope.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'features/app/app.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _runApp();
}

Future<void> _runApp() async {
  final scope = AppScope();
  runApp(App(scope));
}
