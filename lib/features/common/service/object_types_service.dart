import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/domain/repository/objects_type_repository.dart';

class ObjectTypesService {
  final ObjectTypesRepository _objectTypesRepository;

  ObjectTypesService(this._objectTypesRepository);

  Future<List<ObjectTypeData>> getObjectTypes() async {
    return _objectTypesRepository.getObjectTypes();
  }

  Future<ObjectTypeData?> getObjectTypeByName(String objectTypeName) async {
    return _objectTypesRepository.getObjectTypeByName(objectTypeName);
  }

  Future<void> addObjectType(ObjectTypeData data) async {
    await _objectTypesRepository.addObjectType(data);
  }

  Future<void> editObjectType(ObjectTypeData data) async {
    await _objectTypesRepository.editObjectType(data);
  }
}
