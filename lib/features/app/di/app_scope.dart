import 'package:car_service/api/data/car_database.dart';
import 'package:car_service/api/data/object_database.dart';
import 'package:car_service/api/data/object_type_database.dart';
import 'package:car_service/api/data/record_database.dart';
import 'package:car_service/api/service/cars_api.dart';
import 'package:car_service/api/service/object_api.dart';
import 'package:car_service/api/service/object_type_api.dart';
import 'package:car_service/api/service/records_api.dart';
import 'package:car_service/features/common/domain/repository/cars_repository.dart';
import 'package:car_service/features/common/domain/repository/objects_repository.dart';
import 'package:car_service/features/common/domain/repository/objects_type_repository.dart';
import 'package:car_service/features/common/domain/repository/records_repository.dart';
import 'package:car_service/features/common/service/cars_service.dart';
import 'package:car_service/features/common/service/object_types_and_objects_service.dart';
import 'package:car_service/features/common/service/object_types_service.dart';
import 'package:car_service/features/common/service/objects_service.dart';
import 'package:car_service/features/common/service/records_service.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppScope implements IAppScope {
  late final AppRouter _router;
  late final CarsApi _carsApi;
  late final CarsService _carsService;
  late final CarsRepository _carsRepository;
  late final RecordsService _recordsService;
  late final RecordsRepository _recordsRepository;
  late final RecordsApi _recordsApi;
  late final ObjectApi _objectApi;
  late final ObjectsService _objectsService;
  late final ObjectsRepository _objectRepository;
  late final ObjectTypeWithObjectsService _objectTypeWithObjectsService;
  late final ObjectTypesApi _objectTypesApi;
  late final ObjectTypesService _objectTypesService;
  late final ObjectTypesRepository _objectTypesRepository;
  late final SharedPreferences _sharedPreferences;
  @override
  late VoidCallback applicationRebuilder;

  @override
  CarsService get carsService => _carsService;

  @override
  RecordsService get recordsService => _recordsService;

  @override
  ObjectsService get objectsService => _objectsService;

  @override
  ObjectTypesService get objectTypesService => _objectTypesService;

  @override
  ObjectTypeWithObjectsService get objectTypeWithObjectsService => _objectTypeWithObjectsService;

  @override
  AppRouter get router => _router;

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  AppScope(this._sharedPreferences) {
    _router = AppRouter.instance();
    _carsApi = CarsApi(AppCarDatabase());
    _carsService = _initCarsService();
    _recordsApi = RecordsApi(AppRecordDatabase());
    _recordsService = _initRecordsService();
    _objectApi = ObjectApi(AppObjectDatabase());
    _objectsService = _initObjectService();
    _objectTypesApi = ObjectTypesApi(AppObjectTypeDatabase());
    _objectTypesService = _initObjectTypesService();
    _objectTypeWithObjectsService = _initObjectTypeWithObjectsService();
  }

  CarsService _initCarsService() {
    _carsRepository = CarsRepository(_carsApi);
    return CarsService(_carsRepository);
  }

  RecordsService _initRecordsService() {
    _recordsRepository = RecordsRepository(_recordsApi);
    return RecordsService(_recordsRepository);
  }

  ObjectsService _initObjectService() {
    _objectRepository = ObjectsRepository(_objectApi);
    return ObjectsService(_objectRepository);
  }

  ObjectTypesService _initObjectTypesService() {
    _objectTypesRepository = ObjectTypesRepository(_objectTypesApi);
    return ObjectTypesService(_objectTypesRepository);
  }

  ObjectTypeWithObjectsService _initObjectTypeWithObjectsService() {
    return ObjectTypeWithObjectsService(_objectRepository, _objectTypesRepository);
  }
}

abstract class IAppScope {
  VoidCallback get applicationRebuilder;

  AppRouter get router;

  CarsService get carsService;

  RecordsService get recordsService;

  ObjectsService get objectsService;

  ObjectTypesService get objectTypesService;

  ObjectTypeWithObjectsService get objectTypeWithObjectsService;

  SharedPreferences get sharedPreferences;
}
