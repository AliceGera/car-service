import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';
import 'in_service_screen.dart';
import 'in_service_screen_model.dart';

InServiceScreenWidgetModel inServiceScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = InServiceScreenModel(
    appScope.carsService,
  );
  return InServiceScreenWidgetModel(
    model,
    appScope.router,
  );
}

class InServiceScreenWidgetModel extends WidgetModel<InServiceScreen, InServiceScreenModel> implements IInServiceScreenWidgetModel {
  InServiceScreenWidgetModel(
    super._model,
    this.router,
  );

  final AppRouter router;
  final _carsState = UnionStateNotifier<List<CarData>>([]);

  @override
  void openAddCarScreen() {
    router.push(
      AddCarRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void openEditCarScreen(CarData car) {
    router.push(
      EditCarRouter(
        car: car,
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  Future<void> deleteCarInfoScreen(CarData car) async {
    await model.deleteCar(car);
    await loadAgain();
    await router.pop();
  }

  @override
  void openCarInfoScreen(CarData car) {
    router.push(
      CarInfoRouter(
        car: car,
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void initWidgetModel() {
    _getCars();
    super.initWidgetModel();
  }

  Future<void> _getCars() async {
    _carsState.loading();
    try {
      final cars = await model.getCars();
      _carsState.content(cars);
    } on Exception catch (e) {
      _carsState.failure(e);
    }
  }

  @override
  Future<void> loadAgain() async {
    await _getCars();
  }

  @override
  UnionStateNotifier<List<CarData>> get carsState => _carsState;
}

abstract interface class IInServiceScreenWidgetModel implements IWidgetModel {
  UnionStateNotifier<List<CarData>> get carsState;

  void loadAgain();

  void openAddCarScreen();

  void openEditCarScreen(CarData car);

  void openCarInfoScreen(CarData car);

  Future<void> deleteCarInfoScreen(CarData car);
}
