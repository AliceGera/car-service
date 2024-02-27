import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/service_warehouse/screens/service_warehouse_screen/service_warehouse_screen.dart';
import 'package:car_service/features/service_warehouse/screens/service_warehouse_screen/service_warehouse_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

ServiceWarehouseScreenWidgetModel serviceWarehouseScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = ServiceWarehouseScreenModel(
    appScope.objectTypeWithObjectsService,
    appScope.objectsService,
  );

  return ServiceWarehouseScreenWidgetModel(
    model,
    appScope.router,
    appScope as AppScope,
  );
}

class ServiceWarehouseScreenWidgetModel extends WidgetModel<ServiceWarehouseScreen, ServiceWarehouseScreenModel> implements IServiceWarehouseScreenWidgetModel {
  final AppRouter _appRouter;
  final AppScope _appScope;

  ServiceWarehouseScreenWidgetModel(
    super._model,
    this._appRouter,
    this._appScope,
  );

  final _objectTypeWithObjectsState = UnionStateNotifier<List<ObjectTypeWithObjectsData>>([]);

  @override
  void initWidgetModel() {
    //_appScope.giftRecievedRebuilder = loadAgain;
    getObjectTypeWithObjects();
    super.initWidgetModel();
  }

  Future<void> getObjectTypeWithObjects() async {
    _objectTypeWithObjectsState.loading();
    try {
      final gifts = await model.getObjectTypeWithObjects();
      _objectTypeWithObjectsState.content(gifts);
    } on Exception catch (e) {
      _objectTypeWithObjectsState.failure(e);
    }
  }

  @override
  void loadAgain() {
    getObjectTypeWithObjects();
  }

  @override
  void openAddObjectScreen() {
    _appRouter.push(
      AddObjectRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void openEditObjectScreen(ObjectData object, ObjectTypeData objectType) {
    _appRouter.push(
      EditObjectRouter(
        object: object,
        loadAgain: loadAgain,
        objectType: objectType,
      ),
    );
  }

  @override
  Future<void> deleteObject(ObjectData object) async {
   await model.deleteObject(object);
    await getObjectTypeWithObjects();
    await _appRouter.pop();
  }

  @override
  UnionStateNotifier<List<ObjectTypeWithObjectsData>> get objectTypeWithObjectsState => _objectTypeWithObjectsState;
}

abstract class IServiceWarehouseScreenWidgetModel implements IWidgetModel {
  void openAddObjectScreen();

  void openEditObjectScreen(ObjectData objects, ObjectTypeData objectType);

  void loadAgain();

  UnionStateNotifier<List<ObjectTypeWithObjectsData>> get objectTypeWithObjectsState;

  Future<void> deleteObject(ObjectData object);
}
