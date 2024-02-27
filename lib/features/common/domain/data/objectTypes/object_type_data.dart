class ObjectTypeData {
  final int objectTypeId;
  final String objectTypeName;

  ObjectTypeData({
    required this.objectTypeId,
    required this.objectTypeName,
  });

  static ObjectTypeData init() => ObjectTypeData(
        objectTypeName: '',
        objectTypeId: 0,
      );

  ObjectTypeData copyWith({
    int? objectTypeId,
    String? objectTypeName,
  }) {
    return ObjectTypeData(
      objectTypeId: objectTypeId ?? this.objectTypeId,
      objectTypeName: objectTypeName ?? this.objectTypeName,
    );
  }
}
