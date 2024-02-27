import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'object_database.g.dart';

class ObjectTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get objectTypeId => integer()();

  TextColumn get objectName => text()();

  TextColumn get objectCount => text()();

  TextColumn get measureUnit => text()();

  TextColumn get description => text()();

  BlobColumn get photo => blob()();
}

@DriftDatabase(tables: [ObjectTable])
class AppObjectDatabase extends _$AppObjectDatabase {
  AppObjectDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db1.sqlite12'));

    return NativeDatabase.createInBackground(file);
  });
}
