import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/debug/screens/debug_screen/debug_screen_export.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

DebugScreenWidgetModel debugScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = DebugScreenModel();
  final router = appDependencies.router;
  return DebugScreenWidgetModel(
    model,
    router,
  );
}

class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugScreenModel> implements IDebugScreenWidgetModel {
  final AppRouter router;

  DebugScreenWidgetModel(
    super._model,
    this.router,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
  }

  @override
  void openLogsHistory() {
    router.push(LogHistoryRouter());
  }

  @override
  void openUiKit() {
    router.push(const UiKitRouter());
  }
}

abstract class IDebugScreenWidgetModel implements IWidgetModel {
  void closeScreen() {}

  void openLogsHistory();

  void openUiKit();
}
