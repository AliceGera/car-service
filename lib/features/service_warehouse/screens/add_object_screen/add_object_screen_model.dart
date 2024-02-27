import 'dart:typed_data';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/service/object_types_service.dart';
import 'package:car_service/features/common/service/objects_service.dart';
import 'package:elementary/elementary.dart';

class AddObjectScreenModel extends ElementaryModel {
  AddObjectScreenModel(
    this._objectsService,
    this._objectTypesService,
  ) : super();

  final ObjectsService _objectsService;
  final ObjectTypesService _objectTypesService;

  ObjectData _object = ObjectData.init();
  ObjectTypeData _objectType = ObjectTypeData.init();

  ObjectData get object => _object;

  ObjectTypeData get objectType => _objectType;

  set photo(Uint8List data) {
    _object = _object.copyWith(photo: data);
  }

  set objectName(String data) {
    _object = _object.copyWith(objectName: data);
  }

  set objectCount(String data) {
    _object = _object.copyWith(objectCount: data);
  }

  set objectTypeId(int data) {
    _object = _object.copyWith(objectTypeId: data);
  }

  set objectTypeName(String data) {
    _objectType = _objectType.copyWith(objectTypeName: data);
  }

  set description(String data) {
    _object = _object.copyWith(description: data);
  }

  set measureUnit(String data) {
    _object = _object.copyWith(measureUnit: data);
  }

  Future<void> addObjectAndObjectType() async {
    final objectType = await _objectTypesService.getObjectTypeByName(_objectType.objectTypeName);
    if (objectType == null) {
      await _objectTypesService.addObjectType(_objectType);
    }
    final existingObjectType = await _objectTypesService.getObjectTypeByName(_objectType.objectTypeName);
    if (existingObjectType != null) {
      _object = _object.copyWith(objectTypeId: existingObjectType.objectTypeId);
      await _objectsService.addObject(_object);
    }
  }

  Future<List<ObjectTypeData>> getObjectTypes() async {
    final objectTypes = await _objectTypesService.getObjectTypes();
    return objectTypes;
  }
}
