import 'package:car_service/api/service/object_type_api.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/domain/repository/mappers/object_types_mapper.dart';
import 'package:collection/collection.dart';

class ObjectTypesRepository {
  final ObjectTypesApi _apiClient;

  ObjectTypesRepository(this._apiClient);

  Future<List<ObjectTypeData>> getObjectTypes() async {
    final objectTypes = await _apiClient.getObjectTypes();
    return mapDatabaseToObjectType(objectTypes);
  }

  Future<ObjectTypeData?> getObjectTypeByName(String objectTypeName) async {
    final objectTypes = await _apiClient.getObjectTypes();
    final objectType = objectTypes.firstWhereOrNull((e) => e.objectTypeName == objectTypeName);
    return objectType != null
        ? ObjectTypeData(
            objectTypeId: objectType.objectTypeId,
            objectTypeName: objectType.objectTypeName,
          )
        : null;
  }

  Future<void> addObjectType(ObjectTypeData data) async {
    await _apiClient.addObjectType(data);
  }

  Future<void> editObjectType(ObjectTypeData data) async {
    await _apiClient.editObjectType(data);
  }

/*Future<void> deleteHoliday(Holiday data) async {

    await _apiClient.deleteHoliday(data);
  }*/
}
