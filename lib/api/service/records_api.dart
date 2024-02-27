import 'package:car_service/api/data/car_database.dart';
import 'package:car_service/api/data/record_database.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:drift/drift.dart';

class RecordsApi {
  RecordsApi(this.appDatabase);

  final AppRecordDatabase appDatabase;

  Future<List<RecordTableData>> getRecords() async {
    return appDatabase.select(appDatabase.recordTable).get();
  }

  Future<void> addRecord(RecordData data) async {
    await appDatabase.into(appDatabase.recordTable).insert(
          RecordTableCompanion.insert(
            registrationNumber: data.registrationNumber,
            recordDate: data.recordDate!,
            recordTime: data.recordTime!,
            recordBrand: data.recordBrand,
            recordModel: data.recordModel,
            releaseYear: data.releaseYear,
            firstAndLastName: data.firstAndLastName,
            phoneNumber: data.phoneNumber,
            comment: data.comment,
          ),
        );
  }

  Future<void> editRecord(RecordData data) async {
    final resultTable = appDatabase.update(appDatabase.recordTable)..where((t) => t.id.equals(data.id));
    await resultTable.write(
      RecordTableCompanion.insert(
        recordBrand: data.recordBrand,
        recordModel: data.recordModel,
        releaseYear: data.releaseYear,
        registrationNumber: data.registrationNumber,
        firstAndLastName: data.firstAndLastName,
        phoneNumber: data.phoneNumber,
        recordDate: data.recordDate!,
        recordTime: data.recordTime!,
        comment: data.comment,
      ),
    );
  }

  Future<void> deleteRecord(RecordData data) async {
    final resultTable = appDatabase.delete(appDatabase.recordTable)..where((t) => t.id.equals(data.id));
    await resultTable.go();
  }
}
