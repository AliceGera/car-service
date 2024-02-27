import 'package:car_service/api/data/object_database.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';

class ObjectApi {
  ObjectApi(this.appObjectDatabase);

  final AppObjectDatabase appObjectDatabase;

  Future<List<ObjectTableData>> getObjects() async {
    return appObjectDatabase.select(appObjectDatabase.objectTable).get();
  }

  Future<void> addObject(ObjectData data) async {
    await appObjectDatabase.into(appObjectDatabase.objectTable).insert(
          ObjectTableCompanion.insert(
            objectTypeId: data.objectTypeId,
            objectName: data.objectName,
            objectCount: data.objectCount,
            measureUnit: data.measureUnit,
            description: data.description,
            photo: data.photo,
          ),
        );
  }

  Future<void> editObject(ObjectData data) async {
    final resultTable = appObjectDatabase.update(appObjectDatabase.objectTable)..where((t) => t.id.equals(data.id));
    await resultTable.write(
      ObjectTableCompanion.insert(
        objectTypeId: data.objectTypeId,
        objectName: data.objectName,
        objectCount: data.objectCount,
        measureUnit: data.measureUnit,
        description: data.description,
        photo:data.photo,
      ),
    );
  }

  Future<void> deleteObject(ObjectData data) async {
    final resultTable = appObjectDatabase.delete(appObjectDatabase.objectTable)..where((t) => t.id.equals(data.id));
    await resultTable.go();
  }
}
