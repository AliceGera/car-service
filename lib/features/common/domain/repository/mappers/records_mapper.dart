import 'package:car_service/api/data/record_database.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';

List<RecordData> mapDatabaseToRecords(List<RecordTableData> recordsTable) {
  return recordsTable
      .map(
        (e) => RecordData(
          id: e.id,
          recordBrand: e.recordBrand,
          recordModel: e.recordModel,
          releaseYear: e.releaseYear,
          registrationNumber: e.registrationNumber,
          firstAndLastName: e.firstAndLastName,
          phoneNumber: e.phoneNumber,
          comment: e.comment,
          recordDate: e.recordDate,
          recordTime: e.recordTime,
        ),
      )
      .toList();
}
