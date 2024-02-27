import 'package:car_service/api/data/object_database.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';

List<ObjectData> mapDatabaseToObjects(List<ObjectTableData> objectsTable) {
  return objectsTable
      .map(
        (e) => ObjectData(
          id: e.id,
          objectTypeId: e.objectTypeId,
          objectName: e.objectName,
          objectCount: e.objectCount,
          measureUnit: e.measureUnit,
          description: e.description,
          photo: e.photo,
        ),
      )
      .toList();
}
