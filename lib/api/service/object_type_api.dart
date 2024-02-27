import 'package:car_service/api/data/object_type_database.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';


class ObjectTypesApi {
  ObjectTypesApi(this.appDatabase);

  final AppObjectTypeDatabase appDatabase;

  Future<List<ObjectTypeTableData>> getObjectTypes() async {
    return appDatabase.select(appDatabase.objectTypeTable).get();
  }

  Future<void> addObjectType(ObjectTypeData data) async {
    await appDatabase.into(appDatabase.objectTypeTable).insert(
      ObjectTypeTableCompanion.insert(
       // objectTypeId: data.objectTypeId,
            objectTypeName: data.objectTypeName,

          ),
        );
  }

  Future<void> editObjectType(ObjectTypeData data) async {
    final resultTable = appDatabase.update(appDatabase.objectTypeTable)..where((t) => t.objectTypeId.equals(data.objectTypeId));
    await resultTable.write(
      ObjectTypeTableCompanion.insert(
        objectTypeName: data.objectTypeName,
      ),
    );
  }

  /*Future<void> deleteObjectType(ObjectType data) async {
    final resultTable = appDatabase.delete(appDatabase.objectTypeTable)..where((t) => t..equals(data.id));
    await resultTable.go();
  }*/
}
