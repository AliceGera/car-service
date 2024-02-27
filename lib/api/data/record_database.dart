import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'record_database.g.dart';

class RecordTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get recordBrand => text()();

  TextColumn get recordModel => text()();

  TextColumn get releaseYear => text()();

  TextColumn get registrationNumber => text()();

  TextColumn get firstAndLastName => text()();

  TextColumn get phoneNumber => text()();

  DateTimeColumn get recordDate => dateTime()();

  DateTimeColumn get recordTime => dateTime()();

  TextColumn get comment => text()();
}

@DriftDatabase(tables: [RecordTable])
class AppRecordDatabase extends _$AppRecordDatabase {
  AppRecordDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db134.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
