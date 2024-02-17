import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/service_warehouse/screen/service_warehouse_screen.dart';
import 'package:car_service/features/service_warehouse/screen/service_warehouse_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ServiceWarehouseScreenWidgetModel serviceWarehouseScreenWmFactory(
  BuildContext context,
) {
  final scope = context.read<IAppScope>();
  final model = ServiceWarehouseScreenModel();

  return ServiceWarehouseScreenWidgetModel(model);
}

class ServiceWarehouseScreenWidgetModel extends WidgetModel<ServiceWarehouseScreen, ServiceWarehouseScreenModel> implements IServiceWarehouseScreenWidgetModel {
  ServiceWarehouseScreenWidgetModel(super._model);
}

abstract class IServiceWarehouseScreenWidgetModel implements IWidgetModel {}
