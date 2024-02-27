import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';

class CarInfoScreenModel extends ElementaryModel {
  CarInfoScreenModel() : super();

  CarData _car = CarData.init();

  CarData get car => _car;

  set photo(Uint8List newPhoto) {
    _car = car.copyWith(photo: newPhoto);
  }

  set carModel(String newCarModel) {
    _car = car.copyWith(carModel: newCarModel);
  }

  set carBrand(String newCarBrand) {
    _car = car.copyWith(carBrand: newCarBrand);
  }

  set releaseYear(String newReleaseYear) {
    _car = car.copyWith(releaseYear: newReleaseYear);
  }

  set carDate(DateTime? date) {
    _car = car.copyWith(carDate: date);
  }

  set registrationNumber(String newRegistrationNumber) {
    _car = car.copyWith(registrationNumber: newRegistrationNumber);
  }

  set firstAndLastName(String newFirstAndLastName) {
    _car = car.copyWith(firstAndLastName: newFirstAndLastName);
  }

  set phoneNumber(String newPhoneNumber) {
    _car = car.copyWith(phoneNumber: newPhoneNumber);
  }

  set worksList(String newWorksList) {
    _car = car.copyWith(worksList: newWorksList);
  }

  set id(int newId) {
    _car = car.copyWith(id: newId);
  }

  set comment(String newComment) {
    _car = car.copyWith(comment: newComment);
  }
}
