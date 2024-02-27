// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_database.dart';

// ignore_for_file: type=lint
class $ObjectTableTable extends ObjectTable
    with TableInfo<$ObjectTableTable, ObjectTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObjectTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _objectTypeIdMeta =
      const VerificationMeta('objectTypeId');
  @override
  late final GeneratedColumn<int> objectTypeId = GeneratedColumn<int>(
      'object_type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _objectNameMeta =
      const VerificationMeta('objectName');
  @override
  late final GeneratedColumn<String> objectName = GeneratedColumn<String>(
      'object_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _objectCountMeta =
      const VerificationMeta('objectCount');
  @override
  late final GeneratedColumn<String> objectCount = GeneratedColumn<String>(
      'object_count', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _measureUnitMeta =
      const VerificationMeta('measureUnit');
  @override
  late final GeneratedColumn<String> measureUnit = GeneratedColumn<String>(
      'measure_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<Uint8List> photo = GeneratedColumn<Uint8List>(
      'photo', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectTypeId,
        objectName,
        objectCount,
        measureUnit,
        description,
        photo
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'object_table';
  @override
  VerificationContext validateIntegrity(Insertable<ObjectTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_type_id')) {
      context.handle(
          _objectTypeIdMeta,
          objectTypeId.isAcceptableOrUnknown(
              data['object_type_id']!, _objectTypeIdMeta));
    } else if (isInserting) {
      context.missing(_objectTypeIdMeta);
    }
    if (data.containsKey('object_name')) {
      context.handle(
          _objectNameMeta,
          objectName.isAcceptableOrUnknown(
              data['object_name']!, _objectNameMeta));
    } else if (isInserting) {
      context.missing(_objectNameMeta);
    }
    if (data.containsKey('object_count')) {
      context.handle(
          _objectCountMeta,
          objectCount.isAcceptableOrUnknown(
              data['object_count']!, _objectCountMeta));
    } else if (isInserting) {
      context.missing(_objectCountMeta);
    }
    if (data.containsKey('measure_unit')) {
      context.handle(
          _measureUnitMeta,
          measureUnit.isAcceptableOrUnknown(
              data['measure_unit']!, _measureUnitMeta));
    } else if (isInserting) {
      context.missing(_measureUnitMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ObjectTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ObjectTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      objectTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}object_type_id'])!,
      objectName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_name'])!,
      objectCount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_count'])!,
      measureUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}measure_unit'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}photo'])!,
    );
  }

  @override
  $ObjectTableTable createAlias(String alias) {
    return $ObjectTableTable(attachedDatabase, alias);
  }
}

class ObjectTableData extends DataClass implements Insertable<ObjectTableData> {
  final int id;
  final int objectTypeId;
  final String objectName;
  final String objectCount;
  final String measureUnit;
  final String description;
  final Uint8List photo;
  const ObjectTableData(
      {required this.id,
      required this.objectTypeId,
      required this.objectName,
      required this.objectCount,
      required this.measureUnit,
      required this.description,
      required this.photo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_type_id'] = Variable<int>(objectTypeId);
    map['object_name'] = Variable<String>(objectName);
    map['object_count'] = Variable<String>(objectCount);
    map['measure_unit'] = Variable<String>(measureUnit);
    map['description'] = Variable<String>(description);
    map['photo'] = Variable<Uint8List>(photo);
    return map;
  }

  ObjectTableCompanion toCompanion(bool nullToAbsent) {
    return ObjectTableCompanion(
      id: Value(id),
      objectTypeId: Value(objectTypeId),
      objectName: Value(objectName),
      objectCount: Value(objectCount),
      measureUnit: Value(measureUnit),
      description: Value(description),
      photo: Value(photo),
    );
  }

  factory ObjectTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObjectTableData(
      id: serializer.fromJson<int>(json['id']),
      objectTypeId: serializer.fromJson<int>(json['objectTypeId']),
      objectName: serializer.fromJson<String>(json['objectName']),
      objectCount: serializer.fromJson<String>(json['objectCount']),
      measureUnit: serializer.fromJson<String>(json['measureUnit']),
      description: serializer.fromJson<String>(json['description']),
      photo: serializer.fromJson<Uint8List>(json['photo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectTypeId': serializer.toJson<int>(objectTypeId),
      'objectName': serializer.toJson<String>(objectName),
      'objectCount': serializer.toJson<String>(objectCount),
      'measureUnit': serializer.toJson<String>(measureUnit),
      'description': serializer.toJson<String>(description),
      'photo': serializer.toJson<Uint8List>(photo),
    };
  }

  ObjectTableData copyWith(
          {int? id,
          int? objectTypeId,
          String? objectName,
          String? objectCount,
          String? measureUnit,
          String? description,
          Uint8List? photo}) =>
      ObjectTableData(
        id: id ?? this.id,
        objectTypeId: objectTypeId ?? this.objectTypeId,
        objectName: objectName ?? this.objectName,
        objectCount: objectCount ?? this.objectCount,
        measureUnit: measureUnit ?? this.measureUnit,
        description: description ?? this.description,
        photo: photo ?? this.photo,
      );
  @override
  String toString() {
    return (StringBuffer('ObjectTableData(')
          ..write('id: $id, ')
          ..write('objectTypeId: $objectTypeId, ')
          ..write('objectName: $objectName, ')
          ..write('objectCount: $objectCount, ')
          ..write('measureUnit: $measureUnit, ')
          ..write('description: $description, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectTypeId, objectName, objectCount,
      measureUnit, description, $driftBlobEquality.hash(photo));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObjectTableData &&
          other.id == this.id &&
          other.objectTypeId == this.objectTypeId &&
          other.objectName == this.objectName &&
          other.objectCount == this.objectCount &&
          other.measureUnit == this.measureUnit &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.photo, this.photo));
}

class ObjectTableCompanion extends UpdateCompanion<ObjectTableData> {
  final Value<int> id;
  final Value<int> objectTypeId;
  final Value<String> objectName;
  final Value<String> objectCount;
  final Value<String> measureUnit;
  final Value<String> description;
  final Value<Uint8List> photo;
  const ObjectTableCompanion({
    this.id = const Value.absent(),
    this.objectTypeId = const Value.absent(),
    this.objectName = const Value.absent(),
    this.objectCount = const Value.absent(),
    this.measureUnit = const Value.absent(),
    this.description = const Value.absent(),
    this.photo = const Value.absent(),
  });
  ObjectTableCompanion.insert({
    this.id = const Value.absent(),
    required int objectTypeId,
    required String objectName,
    required String objectCount,
    required String measureUnit,
    required String description,
    required Uint8List photo,
  })  : objectTypeId = Value(objectTypeId),
        objectName = Value(objectName),
        objectCount = Value(objectCount),
        measureUnit = Value(measureUnit),
        description = Value(description),
        photo = Value(photo);
  static Insertable<ObjectTableData> custom({
    Expression<int>? id,
    Expression<int>? objectTypeId,
    Expression<String>? objectName,
    Expression<String>? objectCount,
    Expression<String>? measureUnit,
    Expression<String>? description,
    Expression<Uint8List>? photo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectTypeId != null) 'object_type_id': objectTypeId,
      if (objectName != null) 'object_name': objectName,
      if (objectCount != null) 'object_count': objectCount,
      if (measureUnit != null) 'measure_unit': measureUnit,
      if (description != null) 'description': description,
      if (photo != null) 'photo': photo,
    });
  }

  ObjectTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? objectTypeId,
      Value<String>? objectName,
      Value<String>? objectCount,
      Value<String>? measureUnit,
      Value<String>? description,
      Value<Uint8List>? photo}) {
    return ObjectTableCompanion(
      id: id ?? this.id,
      objectTypeId: objectTypeId ?? this.objectTypeId,
      objectName: objectName ?? this.objectName,
      objectCount: objectCount ?? this.objectCount,
      measureUnit: measureUnit ?? this.measureUnit,
      description: description ?? this.description,
      photo: photo ?? this.photo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectTypeId.present) {
      map['object_type_id'] = Variable<int>(objectTypeId.value);
    }
    if (objectName.present) {
      map['object_name'] = Variable<String>(objectName.value);
    }
    if (objectCount.present) {
      map['object_count'] = Variable<String>(objectCount.value);
    }
    if (measureUnit.present) {
      map['measure_unit'] = Variable<String>(measureUnit.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photo.present) {
      map['photo'] = Variable<Uint8List>(photo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObjectTableCompanion(')
          ..write('id: $id, ')
          ..write('objectTypeId: $objectTypeId, ')
          ..write('objectName: $objectName, ')
          ..write('objectCount: $objectCount, ')
          ..write('measureUnit: $measureUnit, ')
          ..write('description: $description, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppObjectDatabase extends GeneratedDatabase {
  _$AppObjectDatabase(QueryExecutor e) : super(e);
  late final $ObjectTableTable objectTable = $ObjectTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [objectTable];
}
