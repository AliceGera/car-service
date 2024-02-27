import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/common/domain/repository/cars_repository.dart';
import 'package:car_service/features/common/domain/repository/records_repository.dart';

class RecordsService {
  final RecordsRepository _recordsRepository;

  RecordsService(this._recordsRepository);

  Future<List<RecordData>> getRecords() async {
    return _recordsRepository.getRecords();
  }

  Future<void> addRecord(RecordData data) async {
    await _recordsRepository.addRecord(data);
  }

  Future<void> deleteRecord(RecordData data) async {
    await _recordsRepository.deleteRecord(data);
  }

  Future<void> editRecord(RecordData data) async {
    await _recordsRepository.editRecord(data);
  }
}
