// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_type_database.dart';

// ignore_for_file: type=lint
class $ObjectTypeTableTable extends ObjectTypeTable
    with TableInfo<$ObjectTypeTableTable, ObjectTypeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObjectTypeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _objectTypeIdMeta =
      const VerificationMeta('objectTypeId');
  @override
  late final GeneratedColumn<int> objectTypeId = GeneratedColumn<int>(
      'object_type_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _objectTypeNameMeta =
      const VerificationMeta('objectTypeName');
  @override
  late final GeneratedColumn<String> objectTypeName = GeneratedColumn<String>(
      'object_type_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [objectTypeId, objectTypeName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'object_type_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ObjectTypeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('object_type_id')) {
      context.handle(
          _objectTypeIdMeta,
          objectTypeId.isAcceptableOrUnknown(
              data['object_type_id']!, _objectTypeIdMeta));
    }
    if (data.containsKey('object_type_name')) {
      context.handle(
          _objectTypeNameMeta,
          objectTypeName.isAcceptableOrUnknown(
              data['object_type_name']!, _objectTypeNameMeta));
    } else if (isInserting) {
      context.missing(_objectTypeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {objectTypeId};
  @override
  ObjectTypeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ObjectTypeTableData(
      objectTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}object_type_id'])!,
      objectTypeName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}object_type_name'])!,
    );
  }

  @override
  $ObjectTypeTableTable createAlias(String alias) {
    return $ObjectTypeTableTable(attachedDatabase, alias);
  }
}

class ObjectTypeTableData extends DataClass
    implements Insertable<ObjectTypeTableData> {
  final int objectTypeId;
  final String objectTypeName;
  const ObjectTypeTableData(
      {required this.objectTypeId, required this.objectTypeName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['object_type_id'] = Variable<int>(objectTypeId);
    map['object_type_name'] = Variable<String>(objectTypeName);
    return map;
  }

  ObjectTypeTableCompanion toCompanion(bool nullToAbsent) {
    return ObjectTypeTableCompanion(
      objectTypeId: Value(objectTypeId),
      objectTypeName: Value(objectTypeName),
    );
  }

  factory ObjectTypeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObjectTypeTableData(
      objectTypeId: serializer.fromJson<int>(json['objectTypeId']),
      objectTypeName: serializer.fromJson<String>(json['objectTypeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'objectTypeId': serializer.toJson<int>(objectTypeId),
      'objectTypeName': serializer.toJson<String>(objectTypeName),
    };
  }

  ObjectTypeTableData copyWith({int? objectTypeId, String? objectTypeName}) =>
      ObjectTypeTableData(
        objectTypeId: objectTypeId ?? this.objectTypeId,
        objectTypeName: objectTypeName ?? this.objectTypeName,
      );
  @override
  String toString() {
    return (StringBuffer('ObjectTypeTableData(')
          ..write('objectTypeId: $objectTypeId, ')
          ..write('objectTypeName: $objectTypeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(objectTypeId, objectTypeName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObjectTypeTableData &&
          other.objectTypeId == this.objectTypeId &&
          other.objectTypeName == this.objectTypeName);
}

class ObjectTypeTableCompanion extends UpdateCompanion<ObjectTypeTableData> {
  final Value<int> objectTypeId;
  final Value<String> objectTypeName;
  const ObjectTypeTableCompanion({
    this.objectTypeId = const Value.absent(),
    this.objectTypeName = const Value.absent(),
  });
  ObjectTypeTableCompanion.insert({
    this.objectTypeId = const Value.absent(),
    required String objectTypeName,
  }) : objectTypeName = Value(objectTypeName);
  static Insertable<ObjectTypeTableData> custom({
    Expression<int>? objectTypeId,
    Expression<String>? objectTypeName,
  }) {
    return RawValuesInsertable({
      if (objectTypeId != null) 'object_type_id': objectTypeId,
      if (objectTypeName != null) 'object_type_name': objectTypeName,
    });
  }

  ObjectTypeTableCompanion copyWith(
      {Value<int>? objectTypeId, Value<String>? objectTypeName}) {
    return ObjectTypeTableCompanion(
      objectTypeId: objectTypeId ?? this.objectTypeId,
      objectTypeName: objectTypeName ?? this.objectTypeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (objectTypeId.present) {
      map['object_type_id'] = Variable<int>(objectTypeId.value);
    }
    if (objectTypeName.present) {
      map['object_type_name'] = Variable<String>(objectTypeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObjectTypeTableCompanion(')
          ..write('objectTypeId: $objectTypeId, ')
          ..write('objectTypeName: $objectTypeName')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppObjectTypeDatabase extends GeneratedDatabase {
  _$AppObjectTypeDatabase(QueryExecutor e) : super(e);
  late final $ObjectTypeTableTable objectTypeTable =
      $ObjectTypeTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [objectTypeTable];
}
