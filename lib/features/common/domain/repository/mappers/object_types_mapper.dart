import 'package:car_service/api/data/object_type_database.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';

List<ObjectTypeData> mapDatabaseToObjectType(List<ObjectTypeTableData> objectTypeTable) {
  return objectTypeTable
      .map(
        (e) => ObjectTypeData(
          objectTypeId: e.objectTypeId,
          objectTypeName: e.objectTypeName,
        ),
      )
      .toList();
}
