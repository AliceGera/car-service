import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';

class AddCarScreenModel extends ElementaryModel {

  //final HolidaysService _holidaysService;

  String _registrationNumber = '';
  String _firstAndLastName= '';
  String _phoneNumber= '';
  String _worksList= '';
  String _comment= '';
  DateTime? _holidayDate;
  Uint8List _photo = Uint8List(0);

  String get registrationNumber => _registrationNumber;
  String get firstAndLastName => _firstAndLastName;
  String get phoneNumber => _phoneNumber;
  String get worksList => _worksList;
  String get comment => _comment;
  DateTime? get holidayDate => _holidayDate;
  Uint8List get photo => _photo;

  set photo(Uint8List newPhoto) {
    _photo = newPhoto;
  }
  set holidayDate(DateTime? date) {
    _holidayDate = date;
  }
  set registrationNumber(String newRegistrationNumber) {
    _registrationNumber = newRegistrationNumber;
  }
  set firstAndLastName(String newFirstAndLastName) {
    _firstAndLastName = newFirstAndLastName;
  }
  set phoneNumber(String newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
  }
  set worksList(String newWorksList) {
    _worksList = newWorksList;
  }
  set comment(String newComment) {
    _comment = newComment;
  }
 // DateTime? get holidayDate => _holidayDate;
/*
  set holidayDate(DateTime? date) {
    _holidayDate = date;
  }

  Uint8List get photo => _photo;

  set photo(Uint8List newPhoto) {
    _photo = newPhoto;
  }*/


  Future<void> addCar() async {
   /* await _holidaysService.addHoliday(
      Holiday(
        id: 1,
        holidayName: _holidayName,
        holidayDate: _holidayDate,
        photo: _photo,
      ),
    );*/
  }
}
