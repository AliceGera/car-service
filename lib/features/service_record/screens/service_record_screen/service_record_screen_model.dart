import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/common/service/records_service.dart';
import 'package:elementary/elementary.dart';
import 'package:weekly_date_picker/datetime_apis.dart';

class ServiceRecordScreenModel extends ElementaryModel {
  ServiceRecordScreenModel(this._recordsService) : super();
  final RecordsService _recordsService;

  DateTime weekDateTime = DateTime.now();
  List<RecordData> records = [];

  List<RecordData> getRecordsForSelectedDay() {
    return records.where((e) => e.recordDate?.isSameDateAs(weekDateTime) == true).toList();
  }

  Future<List<RecordData>> getRecords() async {
    final records = await _recordsService.getRecords();
    return records;
  }

  Future<void> deleteRecord(RecordData data) async {
    await _recordsService.deleteRecord(data);
  }
}
