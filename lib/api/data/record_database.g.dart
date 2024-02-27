// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_database.dart';

// ignore_for_file: type=lint
class $RecordTableTable extends RecordTable
    with TableInfo<$RecordTableTable, RecordTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _recordBrandMeta =
      const VerificationMeta('recordBrand');
  @override
  late final GeneratedColumn<String> recordBrand = GeneratedColumn<String>(
      'record_brand', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordModelMeta =
      const VerificationMeta('recordModel');
  @override
  late final GeneratedColumn<String> recordModel = GeneratedColumn<String>(
      'record_model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _releaseYearMeta =
      const VerificationMeta('releaseYear');
  @override
  late final GeneratedColumn<String> releaseYear = GeneratedColumn<String>(
      'release_year', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _registrationNumberMeta =
      const VerificationMeta('registrationNumber');
  @override
  late final GeneratedColumn<String> registrationNumber =
      GeneratedColumn<String>('registration_number', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstAndLastNameMeta =
      const VerificationMeta('firstAndLastName');
  @override
  late final GeneratedColumn<String> firstAndLastName = GeneratedColumn<String>(
      'first_and_last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordDateMeta =
      const VerificationMeta('recordDate');
  @override
  late final GeneratedColumn<DateTime> recordDate = GeneratedColumn<DateTime>(
      'record_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _recordTimeMeta =
      const VerificationMeta('recordTime');
  @override
  late final GeneratedColumn<DateTime> recordTime = GeneratedColumn<DateTime>(
      'record_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        recordBrand,
        recordModel,
        releaseYear,
        registrationNumber,
        firstAndLastName,
        phoneNumber,
        recordDate,
        recordTime,
        comment
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'record_table';
  @override
  VerificationContext validateIntegrity(Insertable<RecordTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('record_brand')) {
      context.handle(
          _recordBrandMeta,
          recordBrand.isAcceptableOrUnknown(
              data['record_brand']!, _recordBrandMeta));
    } else if (isInserting) {
      context.missing(_recordBrandMeta);
    }
    if (data.containsKey('record_model')) {
      context.handle(
          _recordModelMeta,
          recordModel.isAcceptableOrUnknown(
              data['record_model']!, _recordModelMeta));
    } else if (isInserting) {
      context.missing(_recordModelMeta);
    }
    if (data.containsKey('release_year')) {
      context.handle(
          _releaseYearMeta,
          releaseYear.isAcceptableOrUnknown(
              data['release_year']!, _releaseYearMeta));
    } else if (isInserting) {
      context.missing(_releaseYearMeta);
    }
    if (data.containsKey('registration_number')) {
      context.handle(
          _registrationNumberMeta,
          registrationNumber.isAcceptableOrUnknown(
              data['registration_number']!, _registrationNumberMeta));
    } else if (isInserting) {
      context.missing(_registrationNumberMeta);
    }
    if (data.containsKey('first_and_last_name')) {
      context.handle(
          _firstAndLastNameMeta,
          firstAndLastName.isAcceptableOrUnknown(
              data['first_and_last_name']!, _firstAndLastNameMeta));
    } else if (isInserting) {
      context.missing(_firstAndLastNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('record_date')) {
      context.handle(
          _recordDateMeta,
          recordDate.isAcceptableOrUnknown(
              data['record_date']!, _recordDateMeta));
    } else if (isInserting) {
      context.missing(_recordDateMeta);
    }
    if (data.containsKey('record_time')) {
      context.handle(
          _recordTimeMeta,
          recordTime.isAcceptableOrUnknown(
              data['record_time']!, _recordTimeMeta));
    } else if (isInserting) {
      context.missing(_recordTimeMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      recordBrand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_brand'])!,
      recordModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_model'])!,
      releaseYear: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_year'])!,
      registrationNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}registration_number'])!,
      firstAndLastName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}first_and_last_name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      recordDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}record_date'])!,
      recordTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}record_time'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
    );
  }

  @override
  $RecordTableTable createAlias(String alias) {
    return $RecordTableTable(attachedDatabase, alias);
  }
}

class RecordTableData extends DataClass implements Insertable<RecordTableData> {
  final int id;
  final String recordBrand;
  final String recordModel;
  final String releaseYear;
  final String registrationNumber;
  final String firstAndLastName;
  final String phoneNumber;
  final DateTime recordDate;
  final DateTime recordTime;
  final String comment;
  const RecordTableData(
      {required this.id,
      required this.recordBrand,
      required this.recordModel,
      required this.releaseYear,
      required this.registrationNumber,
      required this.firstAndLastName,
      required this.phoneNumber,
      required this.recordDate,
      required this.recordTime,
      required this.comment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['record_brand'] = Variable<String>(recordBrand);
    map['record_model'] = Variable<String>(recordModel);
    map['release_year'] = Variable<String>(releaseYear);
    map['registration_number'] = Variable<String>(registrationNumber);
    map['first_and_last_name'] = Variable<String>(firstAndLastName);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['record_date'] = Variable<DateTime>(recordDate);
    map['record_time'] = Variable<DateTime>(recordTime);
    map['comment'] = Variable<String>(comment);
    return map;
  }

  RecordTableCompanion toCompanion(bool nullToAbsent) {
    return RecordTableCompanion(
      id: Value(id),
      recordBrand: Value(recordBrand),
      recordModel: Value(recordModel),
      releaseYear: Value(releaseYear),
      registrationNumber: Value(registrationNumber),
      firstAndLastName: Value(firstAndLastName),
      phoneNumber: Value(phoneNumber),
      recordDate: Value(recordDate),
      recordTime: Value(recordTime),
      comment: Value(comment),
    );
  }

  factory RecordTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordTableData(
      id: serializer.fromJson<int>(json['id']),
      recordBrand: serializer.fromJson<String>(json['recordBrand']),
      recordModel: serializer.fromJson<String>(json['recordModel']),
      releaseYear: serializer.fromJson<String>(json['releaseYear']),
      registrationNumber:
          serializer.fromJson<String>(json['registrationNumber']),
      firstAndLastName: serializer.fromJson<String>(json['firstAndLastName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      recordDate: serializer.fromJson<DateTime>(json['recordDate']),
      recordTime: serializer.fromJson<DateTime>(json['recordTime']),
      comment: serializer.fromJson<String>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recordBrand': serializer.toJson<String>(recordBrand),
      'recordModel': serializer.toJson<String>(recordModel),
      'releaseYear': serializer.toJson<String>(releaseYear),
      'registrationNumber': serializer.toJson<String>(registrationNumber),
      'firstAndLastName': serializer.toJson<String>(firstAndLastName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'recordDate': serializer.toJson<DateTime>(recordDate),
      'recordTime': serializer.toJson<DateTime>(recordTime),
      'comment': serializer.toJson<String>(comment),
    };
  }

  RecordTableData copyWith(
          {int? id,
          String? recordBrand,
          String? recordModel,
          String? releaseYear,
          String? registrationNumber,
          String? firstAndLastName,
          String? phoneNumber,
          DateTime? recordDate,
          DateTime? recordTime,
          String? comment}) =>
      RecordTableData(
        id: id ?? this.id,
        recordBrand: recordBrand ?? this.recordBrand,
        recordModel: recordModel ?? this.recordModel,
        releaseYear: releaseYear ?? this.releaseYear,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        firstAndLastName: firstAndLastName ?? this.firstAndLastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        recordDate: recordDate ?? this.recordDate,
        recordTime: recordTime ?? this.recordTime,
        comment: comment ?? this.comment,
      );
  @override
  String toString() {
    return (StringBuffer('RecordTableData(')
          ..write('id: $id, ')
          ..write('recordBrand: $recordBrand, ')
          ..write('recordModel: $recordModel, ')
          ..write('releaseYear: $releaseYear, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('firstAndLastName: $firstAndLastName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('recordDate: $recordDate, ')
          ..write('recordTime: $recordTime, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      recordBrand,
      recordModel,
      releaseYear,
      registrationNumber,
      firstAndLastName,
      phoneNumber,
      recordDate,
      recordTime,
      comment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordTableData &&
          other.id == this.id &&
          other.recordBrand == this.recordBrand &&
          other.recordModel == this.recordModel &&
          other.releaseYear == this.releaseYear &&
          other.registrationNumber == this.registrationNumber &&
          other.firstAndLastName == this.firstAndLastName &&
          other.phoneNumber == this.phoneNumber &&
          other.recordDate == this.recordDate &&
          other.recordTime == this.recordTime &&
          other.comment == this.comment);
}

class RecordTableCompanion extends UpdateCompanion<RecordTableData> {
  final Value<int> id;
  final Value<String> recordBrand;
  final Value<String> recordModel;
  final Value<String> releaseYear;
  final Value<String> registrationNumber;
  final Value<String> firstAndLastName;
  final Value<String> phoneNumber;
  final Value<DateTime> recordDate;
  final Value<DateTime> recordTime;
  final Value<String> comment;
  const RecordTableCompanion({
    this.id = const Value.absent(),
    this.recordBrand = const Value.absent(),
    this.recordModel = const Value.absent(),
    this.releaseYear = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.firstAndLastName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.recordDate = const Value.absent(),
    this.recordTime = const Value.absent(),
    this.comment = const Value.absent(),
  });
  RecordTableCompanion.insert({
    this.id = const Value.absent(),
    required String recordBrand,
    required String recordModel,
    required String releaseYear,
    required String registrationNumber,
    required String firstAndLastName,
    required String phoneNumber,
    required DateTime recordDate,
    required DateTime recordTime,
    required String comment,
  })  : recordBrand = Value(recordBrand),
        recordModel = Value(recordModel),
        releaseYear = Value(releaseYear),
        registrationNumber = Value(registrationNumber),
        firstAndLastName = Value(firstAndLastName),
        phoneNumber = Value(phoneNumber),
        recordDate = Value(recordDate),
        recordTime = Value(recordTime),
        comment = Value(comment);
  static Insertable<RecordTableData> custom({
    Expression<int>? id,
    Expression<String>? recordBrand,
    Expression<String>? recordModel,
    Expression<String>? releaseYear,
    Expression<String>? registrationNumber,
    Expression<String>? firstAndLastName,
    Expression<String>? phoneNumber,
    Expression<DateTime>? recordDate,
    Expression<DateTime>? recordTime,
    Expression<String>? comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recordBrand != null) 'record_brand': recordBrand,
      if (recordModel != null) 'record_model': recordModel,
      if (releaseYear != null) 'release_year': releaseYear,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (firstAndLastName != null) 'first_and_last_name': firstAndLastName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (recordDate != null) 'record_date': recordDate,
      if (recordTime != null) 'record_time': recordTime,
      if (comment != null) 'comment': comment,
    });
  }

  RecordTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? recordBrand,
      Value<String>? recordModel,
      Value<String>? releaseYear,
      Value<String>? registrationNumber,
      Value<String>? firstAndLastName,
      Value<String>? phoneNumber,
      Value<DateTime>? recordDate,
      Value<DateTime>? recordTime,
      Value<String>? comment}) {
    return RecordTableCompanion(
      id: id ?? this.id,
      recordBrand: recordBrand ?? this.recordBrand,
      recordModel: recordModel ?? this.recordModel,
      releaseYear: releaseYear ?? this.releaseYear,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      firstAndLastName: firstAndLastName ?? this.firstAndLastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      recordDate: recordDate ?? this.recordDate,
      recordTime: recordTime ?? this.recordTime,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recordBrand.present) {
      map['record_brand'] = Variable<String>(recordBrand.value);
    }
    if (recordModel.present) {
      map['record_model'] = Variable<String>(recordModel.value);
    }
    if (releaseYear.present) {
      map['release_year'] = Variable<String>(releaseYear.value);
    }
    if (registrationNumber.present) {
      map['registration_number'] = Variable<String>(registrationNumber.value);
    }
    if (firstAndLastName.present) {
      map['first_and_last_name'] = Variable<String>(firstAndLastName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (recordDate.present) {
      map['record_date'] = Variable<DateTime>(recordDate.value);
    }
    if (recordTime.present) {
      map['record_time'] = Variable<DateTime>(recordTime.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordTableCompanion(')
          ..write('id: $id, ')
          ..write('recordBrand: $recordBrand, ')
          ..write('recordModel: $recordModel, ')
          ..write('releaseYear: $releaseYear, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('firstAndLastName: $firstAndLastName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('recordDate: $recordDate, ')
          ..write('recordTime: $recordTime, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppRecordDatabase extends GeneratedDatabase {
  _$AppRecordDatabase(QueryExecutor e) : super(e);
  late final $RecordTableTable recordTable = $RecordTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recordTable];
}
