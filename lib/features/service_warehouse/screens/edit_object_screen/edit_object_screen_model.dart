import 'dart:typed_data';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';
import 'package:car_service/features/common/service/object_types_service.dart';
import 'package:car_service/features/common/service/objects_service.dart';
import 'package:elementary/elementary.dart';

class EditObjectScreenModel extends ElementaryModel {
  EditObjectScreenModel(
    this._objectsService,
    this._objectTypesService,
  ) : super();

  final ObjectsService _objectsService;
  final ObjectTypesService _objectTypesService;

  ObjectTypeWithObjectsData _objectTypeWithObjects = ObjectTypeWithObjectsData.init().copyWith(objects: [ObjectData.init()]);

  ObjectTypeWithObjectsData get objectTypeWithObjects => _objectTypeWithObjects;

  set photo(Uint8List newPhoto) {
    _objectTypeWithObjects.objects.first = _objectTypeWithObjects.objects.first.copyWith(photo: newPhoto);
  }

  set objectName(String newPhoto) {
    _objectTypeWithObjects.objects.first = _objectTypeWithObjects.objects.first.copyWith(objectName: newPhoto);
  }

  set objectCount(String newPhoto) {
    _objectTypeWithObjects.objects.first = _objectTypeWithObjects.objects.first.copyWith(objectCount: newPhoto);
  }

  set objectId(int objectId) {
    _objectTypeWithObjects.objects.first = _objectTypeWithObjects.objects.first.copyWith(id: objectId);
  }

  set objectTypeId(int newPhoto) {
    _objectTypeWithObjects.objects.first = _objectTypeWithObjects.objects.first.copyWith(objectTypeId: newPhoto);
  }

  set objectTypeName(String newPhoto) {
    _objectTypeWithObjects = _objectTypeWithObjects.copyWith(
      objectType: _objectTypeWithObjects.objectType.copyWith(objectTypeName: newPhoto),
    );
  }

  set description(String newPhoto) {
    _objectTypeWithObjects.objects.first = _objectTypeWithObjects.objects.first.copyWith(description: newPhoto);
  }

  set measureUnit(String newPhoto) {
    _objectTypeWithObjects.objects.first = _objectTypeWithObjects.objects.first.copyWith(measureUnit: newPhoto);
  }

  Future<void> editObject() async {
    final objectType = await _objectTypesService.getObjectTypeByName(_objectTypeWithObjects.objectType.objectTypeName);
    if (objectType == null) {
      await _objectTypesService.addObjectType(_objectTypeWithObjects.objectType);
    }
    final existingObjectType = await _objectTypesService.getObjectTypeByName(_objectTypeWithObjects.objectType.objectTypeName);
    if (existingObjectType != null) {
      _objectTypeWithObjects.objects.first = _objectTypeWithObjects.objects.first.copyWith(objectTypeId: existingObjectType.objectTypeId);
      await _objectsService.editObject(_objectTypeWithObjects.objects.first);
    }
  }

  Future<List<ObjectTypeData>> getObjectTypes() async {
    final objectTypes = await _objectTypesService.getObjectTypes();
    return objectTypes;
  }
}
