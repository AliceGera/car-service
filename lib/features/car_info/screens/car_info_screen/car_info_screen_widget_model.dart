import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/car_info/screens/car_info_screen/car_info_screen.dart';
import 'package:car_service/features/car_info/screens/car_info_screen/car_info_screen_model.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

CarInfoScreenWidgetModel carInfoScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = CarInfoScreenModel();

  return CarInfoScreenWidgetModel(
    model,
    appScope.router,
  );
}

class CarInfoScreenWidgetModel extends WidgetModel<CarInfoScreen, CarInfoScreenModel> implements ICarInfoScreenWidgetModel {
  final AppRouter router;

  CarInfoScreenWidgetModel(
    super._model,
    this.router,
  );

  final _carState = ValueNotifier<CarData>(CarData.init());
  void Function()? _updateCar;

  @override
  void initWidgetModel() {
    final args = router.current.args is CarInfoRouterArgs ? router.current.args! as CarInfoRouterArgs : null;

    if (args != null) {
      model
        ..phoneNumber = args.car.phoneNumber
        ..worksList = args.car.worksList
        ..comment = args.car.comment
        ..firstAndLastName = args.car.firstAndLastName
        ..registrationNumber = args.car.registrationNumber
        ..photo = args.car.photo
        ..id = args.car.id
        ..carDate = args.car.carDate
        ..releaseYear = args.car.releaseYear
        ..carBrand = args.car.carBrand
        ..carModel = args.car.carModel;
      _carState.value = model.car;
      _updateCar = args.loadAgain;
    }
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

  @override
  Future<void> refreshCar(CarData car) async {
    model
      ..phoneNumber = car.phoneNumber
      ..worksList = car.worksList
      ..comment = car.comment
      ..firstAndLastName = car.firstAndLastName
      ..registrationNumber = car.registrationNumber
      ..photo = car.photo
      ..id = car.id
      ..carDate = car.carDate
      ..releaseYear = car.releaseYear
      ..carBrand = car.carBrand
      ..carModel = car.carModel;
    _carState.value = model.car;
    _updateCar?.call();
  }

  @override
  void openEditCarScreen(CarData car) {
    router.push(
      EditCarRouter(
        car: car,
        refreshCar: refreshCar,
      ),
    );
  }

  @override
  ValueNotifier<CarData> get carState => _carState;
}

abstract interface class ICarInfoScreenWidgetModel implements IWidgetModel {
  void closeScreen();

  void openEditCarScreen(CarData car);

  ValueNotifier<CarData> get carState;
}
