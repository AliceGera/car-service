import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/dash/screen/dash_screen_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

DashScreenWidgetModel dashScreenWmFactory(
  BuildContext context,
) {
  final scope = context.read<IAppScope>();
  final model = DashScreenModel();

  return DashScreenWidgetModel(model);
}

/// Widget model for [DashScreen].
class DashScreenWidgetModel extends WidgetModel<DashScreen, DashScreenModel> implements IDashScreenWidgetModel {
  DashScreenWidgetModel(super._model);
}

/// Interface of [IDashScreenWidgetModel].
abstract class IDashScreenWidgetModel implements IWidgetModel {}
