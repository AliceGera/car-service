import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/service/cars_service.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';

class AddCarScreenModel extends ElementaryModel {
  AddCarScreenModel(this._carsService) : super();
  final CarsService _carsService;
  CarData _car = CarData.init();

  CarData get car => _car;

  set photo(Uint8List newPhoto) {
    _car = car.copyWith(photo: newPhoto);
  }

  set carModel(String newCarModel) {
    _car = _car.copyWith(carModel: newCarModel);
  }

  set carBrand(String newCarBrandl) {
    _car = _car.copyWith(carBrand: newCarBrandl);
  }

  set releaseYear(String newReleaseYear) {
    _car = _car.copyWith(releaseYear: newReleaseYear);
  }

  set carDate(DateTime? date) {
    _car = _car.copyWith(carDate: date);
  }

  set registrationNumber(String newRegistrationNumber) {
    _car = _car.copyWith(registrationNumber: newRegistrationNumber);
  }

  set firstAndLastName(String newFirstAndLastName) {
    _car = _car.copyWith(firstAndLastName: newFirstAndLastName);
  }

  set phoneNumber(String newPhoneNumber) {
    _car = _car.copyWith(phoneNumber: newPhoneNumber);
  }

  set worksList(String newWorksList) {
    _car = _car.copyWith(worksList: newWorksList);
  }

  set comment(String newComment) {
    _car = _car.copyWith(comment: newComment);
  }

  Future<void> addCar() async {
    await _carsService.addCar(_car);
  }
}
