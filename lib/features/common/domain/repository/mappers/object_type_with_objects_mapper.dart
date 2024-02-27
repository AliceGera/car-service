import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';

List<ObjectTypeWithObjectsData> mapDatabaseToObjectTypeWithObjects(
  List<ObjectData> objects,
  List<ObjectTypeData> objectTypes,
//
) {
  List<ObjectTypeWithObjectsData> objectTypeWithObjectsData = [];
  for (final objectType in objectTypes) {
    objectTypeWithObjectsData.add(
      ObjectTypeWithObjectsData(
        objects: objects
            .where(
              (object) => object.objectTypeId == objectType.objectTypeId,
            )
            .toList(),
        objectType: objectType,
      ),
    );
  }
  return objectTypeWithObjectsData;
}
