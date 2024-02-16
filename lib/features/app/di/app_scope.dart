
import 'package:flutter/material.dart';
import '../../navigation/service/router.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final AppRouter _router;

  @override
  late VoidCallback applicationRebuilder;

  @override
  AppRouter get router => _router;

  /// Create an instance [AppScope].
  AppScope() {
    _router = AppRouter.instance();
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;
}
