import 'package:car_service/features/services/screens/services_screen/services_model.dart';
import 'package:car_service/features/services/screens/services_screen/services_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

ServicesScreenWidgetModel servicesScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = ServicesScreenModel();
  return ServicesScreenWidgetModel(model);
}

abstract interface class IServicesScreenWidgetModel implements IWidgetModel {}

class ServicesScreenWidgetModel extends WidgetModel<ServicesScreen, ServicesScreenModel> implements IServicesScreenWidgetModel {
  ServicesScreenWidgetModel(super._model);
}

