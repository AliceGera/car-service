import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';

class ObjectTypeWithObjectsData {
  final List<ObjectData> objects;

  final ObjectTypeData objectType;

  ObjectTypeWithObjectsData({
    required this.objects,
    required this.objectType,
  });

  static ObjectTypeWithObjectsData init() => ObjectTypeWithObjectsData(
        objects: [],
        objectType: ObjectTypeData.init(),
      );

  ObjectTypeWithObjectsData copyWith({
    List<ObjectData>? objects,
    ObjectTypeData? objectType,
  }) {
    return ObjectTypeWithObjectsData(
      objects: objects ?? this.objects,
      objectType: objectType ?? this.objectType,
    );
  }
}
