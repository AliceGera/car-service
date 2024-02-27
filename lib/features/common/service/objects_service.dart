
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/repository/objects_repository.dart';

class ObjectsService {
  final ObjectsRepository _objectsRepository;

  ObjectsService(this._objectsRepository);

  Future<Future<List<ObjectData>>> getObjects() async {
    return _objectsRepository.getObjects();
  }

  Future<void> addObject(ObjectData data) async {
    await _objectsRepository.addObject(data);
  }

  Future<void> deleteObject(ObjectData data) async {
    await _objectsRepository.deleteObject(data);
  }

  Future<void> editObject(ObjectData data) async {
    await _objectsRepository.editObject(data);
  }
}
