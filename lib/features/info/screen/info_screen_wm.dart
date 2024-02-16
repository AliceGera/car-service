import 'package:car_service/features/info/screen/info_screen_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

InfoScreenWidgetModel infoScreenWmFactory(
  BuildContext context,
) {
  final model = InfoScreenModel();
  return InfoScreenWidgetModel(model);
}

class InfoScreenWidgetModel extends WidgetModel<InfoScreen, InfoScreenModel> implements IInfoScreenWidgetModel {
  InfoScreenWidgetModel(super._model);
}

abstract interface class IInfoScreenWidgetModel implements IWidgetModel {}
