import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/domain/repository/cars_repository.dart';

class CarsService {
  final CarsRepository _carsRepository;

  CarsService(this._carsRepository);

  Future<Future<List<CarData>>> getCars() async {
    return _carsRepository.getCars();
  }

  Future<void> addCar(CarData data) async {
    await _carsRepository.addCar(data);
  }

  Future<void> deleteCar(CarData data) async {
    await _carsRepository.deleteCar(data);
  }

  Future<void> editCar(CarData data) async {
    await _carsRepository.editCar(data);
  }
}
