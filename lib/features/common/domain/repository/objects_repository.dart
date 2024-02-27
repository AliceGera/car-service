
import 'package:car_service/api/service/object_api.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/repository/mappers/objects_mapper.dart';

class ObjectsRepository {
  final ObjectApi _apiClient;

  ObjectsRepository(this._apiClient);

  Future<List<ObjectData>> getObjects() async {
    final some = await _apiClient.getObjects();
    return mapDatabaseToObjects(some);
  }

  Future<void> addObject(ObjectData data) async {
    await _apiClient.addObject(data);
  }

  Future<void> deleteObject(ObjectData data) async {
    await _apiClient.deleteObject(data);
  }

  Future<void> editObject(ObjectData data) async {
    await _apiClient.editObject(data);
  }

}
