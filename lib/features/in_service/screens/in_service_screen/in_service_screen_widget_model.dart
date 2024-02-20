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
  final _carsState = UnionStateNotifier<List<Car>>([]);

  @override
  void openAddCarScreen() {
    router.push(
      AddCarRouter(
        loadAgain: loadAgain,
      ),
    );
  }

  @override
  void initWidgetModel() {
    _getCars();
    //_appScope.holidayRebuilder = _getHolidays;
    super.initWidgetModel();
  }

  Future<void> _getCars() async {
    _carsState.loading();
    try {
      final holidays = await model.getCars();
      _carsState.content(holidays);
    } on Exception catch (e) {
      _carsState.failure(e);
    }
  }

  @override
  Future<void> loadAgain() async {
    //_appScope.giftRecievedRebuilder.call();
    //_appScope.giftGivenRebuilder.call();
    await _getCars();
  }

  @override
  UnionStateNotifier<List<Car>> get carsState => _carsState;
}

abstract interface class IInServiceScreenWidgetModel implements IWidgetModel {
  void loadAgain();

  UnionStateNotifier<List<Car>> get carsState;

  void openAddCarScreen();
}
