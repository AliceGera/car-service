import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/common/service/records_service.dart';
import 'package:elementary/elementary.dart';

class EditRecordScreenModel extends ElementaryModel {
  EditRecordScreenModel(this._recordsService) : super();

  final RecordsService _recordsService;
  RecordData _record = RecordData.init();

  RecordData get record => _record;

  set recordId(int? recordId) {
    _record = _record.copyWith(id: recordId);
  }

  set recordModel(String data) {
    _record = _record.copyWith(recordModel: data);
  }

  set recordBrand(String data) {
    _record = _record.copyWith(recordBrand: data);
  }

  set releaseYear(String newReleaseYear) {
    _record = _record.copyWith(releaseYear: newReleaseYear);
  }

  set recordDate(DateTime? date) {
    _record = _record.copyWith(recordDate: date);
  }

  set recordTime(DateTime? date) {
    _record = _record.copyWith(recordTime: date);
  }

  set registrationNumber(String newRegistrationNumber) {
    _record = _record.copyWith(registrationNumber: newRegistrationNumber);
  }

  set firstAndLastName(String newFirstAndLastName) {
    _record = _record.copyWith(firstAndLastName: newFirstAndLastName);
  }

  set phoneNumber(String newPhoneNumber) {
    _record = _record.copyWith(phoneNumber: newPhoneNumber);
  }

  set comment(String newComment) {
    _record = _record.copyWith(comment: newComment);
  }

  Future<void> editRecord() async {
    await _recordsService.editRecord(_record);
  }
}
