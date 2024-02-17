import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/settings/screens/settings_screen/settings_screen.dart';
import 'package:car_service/features/settings/screens/settings_screen/settings_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SettingsScreenWidgetModel settingsScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = SettingsScreenModel();
  final router = appDependencies.router;
  return SettingsScreenWidgetModel(
    model,
    router,
  );
}

class SettingsScreenWidgetModel extends WidgetModel<SettingsScreen, SettingsScreenModel> implements ISettingsScreenWidgetModel {
  final AppRouter router;

  SettingsScreenWidgetModel(
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

  /*@override
  void openLogsHistory() {
    router.push(LogHistoryRouter());
  }*/

  /*@override
  void openUiKit() {
    router.push(const UiKitRouter());
  }*/
}

abstract class ISettingsScreenWidgetModel implements IWidgetModel {
  void closeScreen() {}

 /* void openLogsHistory();

  void openUiKit();*/
}
