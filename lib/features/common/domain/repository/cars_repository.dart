import 'package:car_service/api/service/cars_api.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'mappers/cars_mapper.dart';

class CarsRepository {
  final CarsApi _apiClient;

  CarsRepository(this._apiClient);

  Future<List<CarData>> getCars() async {
    final some = await _apiClient.getCars();
    return mapDatabaseToCars(some);
  }

  Future<void> addCar(CarData data) async {
    await _apiClient.addCar(data);
  }

  Future<void> editCar(CarData data) async {
    await _apiClient.editCar(data);
  }
  Future<void> deleteCar(CarData data) async {

    await _apiClient.deleteCar(data);
  }
}
