import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'in_service_screen.dart';
import 'in_service_screen_model.dart';

InServiceScreenWidgetModel inServiceScreenWmFactory(
  BuildContext context,
) {
  final model = InServiceScreenModel();
  return InServiceScreenWidgetModel(model);
}

class InServiceScreenWidgetModel extends WidgetModel<InServiceScreen, InServiceScreenModel> implements IInfoScreenWidgetModel {
  InServiceScreenWidgetModel(super._model);
}

abstract interface class IInfoScreenWidgetModel implements IWidgetModel {}
