import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'car_database.g.dart';

class CarTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  BlobColumn get photo => blob()();
  TextColumn get carBrand => text()();
  TextColumn get carModel => text()();
  TextColumn get releaseYear=> text()();
  TextColumn get registrationNumber => text()();
  TextColumn get firstAndLastName => text()();
  TextColumn get phoneNumber => text()();
  DateTimeColumn get carDate => dateTime().nullable()();
  TextColumn get worksList => text()();
  TextColumn get comment => text()();
}

@DriftDatabase(tables: [CarTable])
class AppCarDatabase extends _$AppCarDatabase {
  AppCarDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db1.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
