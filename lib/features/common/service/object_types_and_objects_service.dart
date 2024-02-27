
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';
import 'package:car_service/features/common/domain/repository/mappers/object_type_with_objects_mapper.dart';
import 'package:car_service/features/common/domain/repository/objects_repository.dart';
import 'package:car_service/features/common/domain/repository/objects_type_repository.dart';

class ObjectTypeWithObjectsService {
  final ObjectsRepository _objectsRepository;
  final ObjectTypesRepository _objectTypesRepository;

  ObjectTypeWithObjectsService(
    this._objectsRepository,
    this._objectTypesRepository,
  );

  Future<List<ObjectTypeWithObjectsData>> getObjectTypeWithObjects() async {
    final objects = await _objectsRepository.getObjects();
    final objectTypes = await _objectTypesRepository.getObjectTypes();
    return mapDatabaseToObjectTypeWithObjects(
      objects,
      objectTypes,
    );
  }
}
