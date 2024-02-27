import 'dart:typed_data';

class ObjectData {
  final int id;
  final String objectName;
  final int objectTypeId;
  final String objectCount;
  final String measureUnit;
  final String description;
  final Uint8List photo;

  ObjectData({
    required this.id,
    required this.objectTypeId,
    required this.objectCount,
    required this.objectName,
    required this.measureUnit,
    required this.description,
    required this.photo,
  });

  static ObjectData init() => ObjectData(
        id: 0,
        objectTypeId: 0,
        objectCount: '',
        objectName: '',
        measureUnit: '',
        description: '',
        photo: Uint8List(0),
      );

  ObjectData copyWith({
    int? id,
    int? objectTypeId,
    String? objectCount,
    String? objectName,
    String? measureUnit,
    String? description,
    Uint8List? photo,
  }) {
    return ObjectData(
      id: id ?? this.id,
      objectTypeId: objectTypeId ?? this.objectTypeId,
      objectCount: objectCount ?? this.objectCount,
      objectName: objectName ?? this.objectName,
      measureUnit: measureUnit ?? this.measureUnit,
      description: description ?? this.description,
      photo: photo ?? this.photo,
    );
  }
}
