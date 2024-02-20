import 'dart:typed_data';

class Car {
  final int id;
  final Uint8List photo;
  final String carBrand;
  final String carModel;
  final String releaseYear;
  final String registrationNumber;
  final String firstAndLastName;
  final String phoneNumber;
  final DateTime? carDate;
  final String worksList;
  final String comment;

  Car({
    required this.id,
    required this.photo,
    required this.carBrand,
    required this.carModel,
    required this.releaseYear,
    required this.registrationNumber,
    required this.firstAndLastName,
    required this.phoneNumber,
    required this.worksList,
    required this.comment,
    this.carDate,
  });

  static Car init() => Car(
        id: 0,
        photo: Uint8List(0),
        carBrand: '',
        carModel: '',
        releaseYear: '',
        registrationNumber: '',
        firstAndLastName: '',
        phoneNumber: '',
        worksList: '',
        comment: '',
      );
}
