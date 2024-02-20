import 'package:car_service/api/data/car_database.dart';
import 'package:car_service/api/service/cars_api.dart';
import 'package:car_service/features/common/domain/repository/cars_repository.dart';
import 'package:car_service/features/common/service/cars_service.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:flutter/material.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final AppRouter _router;
  late final CarsApi _carsApi;
  late final CarsService _carsService;
  late final CarsRepository _carsRepository;
  @override
  late VoidCallback applicationRebuilder;

  @override
  CarsService get carsService => _carsService;

  @override
  AppRouter get router => _router;

  /// Create an instance [AppScope].
  AppScope() {
    _router = AppRouter.instance();
    _carsApi = CarsApi(AppCarDatabase());
    _carsService = _initCarsService();
  }

  CarsService _initCarsService() {
    _carsRepository = CarsRepository(_carsApi);
    return CarsService(_carsRepository);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  CarsService get carsService;
}
