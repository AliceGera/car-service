import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';
import 'package:car_service/features/common/service/object_types_and_objects_service.dart';
import 'package:car_service/features/common/service/objects_service.dart';
import 'package:elementary/elementary.dart';

class ServiceWarehouseScreenModel extends ElementaryModel {
  ServiceWarehouseScreenModel(this._objectTypeWithObjectsService, this._objectService) : super();
  final ObjectsService _objectService;
  final ObjectTypeWithObjectsService _objectTypeWithObjectsService;
  ObjectData _object = ObjectData.init();

  ObjectData get object => _object;

  set object(ObjectData newObjectData) {
    _object = newObjectData;
  }


  set objectTypeId(int newHolidayId) {
    _object = _object.copyWith(objectTypeId: newHolidayId);
  }

  set objectCount(String newObjectCount) {
    _object = _object.copyWith(objectCount: newObjectCount);
  }

  set objectName(String newPhoto) {
    _object = _object.copyWith(objectName: newPhoto);
  }

  set measureUnit(String newMeasureUnit) {
    _object = _object.copyWith(measureUnit: newMeasureUnit);
  }

  set description(String newDescription) {
    _object = _object.copyWith(description: newDescription);
  }

  Future<void> editObject() async {
    await _objectService.editObject(_object);
  }

  Future<void> deleteObject(ObjectData object) async {
    await _objectService.deleteObject(object);
  }

  Future<List<ObjectTypeWithObjectsData>> getObjectTypeWithObjects() async {
    final objects = await _objectTypeWithObjectsService.getObjectTypeWithObjects();
    return objects;
  }
}
