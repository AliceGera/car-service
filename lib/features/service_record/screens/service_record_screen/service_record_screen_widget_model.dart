import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/service_record/screens/service_record_screen/service_record_screen.dart';
import 'package:car_service/features/service_record/screens/service_record_screen/service_record_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

ServiceRecordScreenWidgetModel serviceRecordScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = ServiceRecordScreenModel(
    appScope.recordsService,
  );
  return ServiceRecordScreenWidgetModel(
    model,
    appScope.router,
  );
}

class ServiceRecordScreenWidgetModel extends WidgetModel<ServiceRecordScreen, ServiceRecordScreenModel> implements IServiceRecordScreenWidgetModel {
  ServiceRecordScreenWidgetModel(
    super._model,
    this.router,
  );

  final AppRouter router;
  final _serviceRecordState = UnionStateNotifier<List<RecordData>>([]);

  @override
  void openAddRecordScreen() {
    router.push(
      AddRecordRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void openEditRecordScreen(RecordData record) {
    router.push(
      EditRecordRouter(
        record: record,
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  Future<void> deleteRecordScreen(RecordData data) async {
    await model.deleteRecord(data);
    await loadAgain();
    await router.pop();
  }

  @override
  void setWeekDateTime(DateTime weekDateTime)  {
    model.weekDateTime = weekDateTime;
    final records =  model.getRecordsForSelectedDay();
    _serviceRecordState.content(records);
  }

  @override
  void initWidgetModel() {
    _getRecords();
    super.initWidgetModel();
  }

  Future<void> _getRecords() async {
    _serviceRecordState.loading();
    try {
      final records = await model.getRecords();
      model.records = records;
      _serviceRecordState.content(model.getRecordsForSelectedDay());
    } on Exception catch (e) {
      _serviceRecordState.failure(e);
    }
  }

  @override
  Future<void> loadAgain() async {
    await _getRecords();
  }

  @override
  UnionStateNotifier<List<RecordData>> get serviceRecordState => _serviceRecordState;
}

abstract interface class IServiceRecordScreenWidgetModel implements IWidgetModel {
  UnionStateNotifier<List<RecordData>> get serviceRecordState;

  void loadAgain();

  void openAddRecordScreen();

  void openEditRecordScreen(RecordData data);

  Future<void> deleteRecordScreen(RecordData data);

  void setWeekDateTime(DateTime weekDateTime);
}
