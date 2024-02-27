import 'dart:typed_data';

class CarData {
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

  CarData({
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

  static CarData init() => CarData(
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

  CarData copyWith({
    int? id,
    Uint8List? photo,
    String? carBrand,
    String? carModel,
    String? releaseYear,
    String? registrationNumber,
    String? firstAndLastName,
    String? phoneNumber,
    DateTime? carDate,
    String? worksList,
    String? comment,
  }) {
    return CarData(
      id: id ?? this.id,
      photo: photo ?? this.photo,
      carBrand: carBrand ?? this.carBrand,
      carModel: carModel ?? this.carModel,
      releaseYear: releaseYear ?? this.releaseYear,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      firstAndLastName: firstAndLastName ?? this.firstAndLastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      carDate: carDate ?? this.carDate,
      worksList: worksList ?? this.worksList,
      comment: comment ?? this.comment,
    );
  }
}
