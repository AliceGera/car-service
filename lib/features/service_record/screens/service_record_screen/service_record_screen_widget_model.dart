import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/service_record/screens/service_record_screen/service_record_screen.dart';
import 'package:car_service/features/service_record/screens/service_record_screen/service_record_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ServiceRecordScreenWidgetModel serviceRecordScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = ServiceRecordScreenModel();
  final router = appDependencies.router;
  return ServiceRecordScreenWidgetModel(
    model,
    router,
  );
}

class ServiceRecordScreenWidgetModel extends WidgetModel<ServiceRecordScreen, ServiceRecordScreenModel> implements IServiceRecordScreenWidgetModel {
  final AppRouter router;

  ServiceRecordScreenWidgetModel(
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

abstract class IServiceRecordScreenWidgetModel implements IWidgetModel {
  void closeScreen() {}

 /* void openLogsHistory();

  void openUiKit();*/
}
