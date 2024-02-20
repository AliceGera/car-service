import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/service/cars_service.dart';
import 'package:elementary/elementary.dart';

class InServiceScreenModel extends ElementaryModel {
  InServiceScreenModel(this._carsService) : super();
  final CarsService _carsService;

  Future<List<Car>> getCars() async {
    final cars = await _carsService.getCars();
    return cars;
  }

  Future<void> deleteCars(Car car) async {
    await _carsService.deleteCar(car);
  }
}
