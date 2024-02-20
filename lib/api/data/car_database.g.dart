// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_database.dart';

// ignore_for_file: type=lint
class $CarTableTable extends CarTable
    with TableInfo<$CarTableTable, CarTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<Uint8List> photo = GeneratedColumn<Uint8List>(
      'photo', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _carBrandMeta =
      const VerificationMeta('carBrand');
  @override
  late final GeneratedColumn<String> carBrand = GeneratedColumn<String>(
      'car_brand', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _carModelMeta =
      const VerificationMeta('carModel');
  @override
  late final GeneratedColumn<String> carModel = GeneratedColumn<String>(
      'car_model', aliasedName, false,
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
  static const VerificationMeta _carDateMeta =
      const VerificationMeta('carDate');
  @override
  late final GeneratedColumn<DateTime> carDate = GeneratedColumn<DateTime>(
      'car_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _worksListMeta =
      const VerificationMeta('worksList');
  @override
  late final GeneratedColumn<String> worksList = GeneratedColumn<String>(
      'works_list', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        photo,
        carBrand,
        carModel,
        releaseYear,
        registrationNumber,
        firstAndLastName,
        phoneNumber,
        carDate,
        worksList,
        comment
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'car_table';
  @override
  VerificationContext validateIntegrity(Insertable<CarTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (data.containsKey('car_brand')) {
      context.handle(_carBrandMeta,
          carBrand.isAcceptableOrUnknown(data['car_brand']!, _carBrandMeta));
    } else if (isInserting) {
      context.missing(_carBrandMeta);
    }
    if (data.containsKey('car_model')) {
      context.handle(_carModelMeta,
          carModel.isAcceptableOrUnknown(data['car_model']!, _carModelMeta));
    } else if (isInserting) {
      context.missing(_carModelMeta);
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
    if (data.containsKey('car_date')) {
      context.handle(_carDateMeta,
          carDate.isAcceptableOrUnknown(data['car_date']!, _carDateMeta));
    }
    if (data.containsKey('works_list')) {
      context.handle(_worksListMeta,
          worksList.isAcceptableOrUnknown(data['works_list']!, _worksListMeta));
    } else if (isInserting) {
      context.missing(_worksListMeta);
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
  CarTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CarTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}photo'])!,
      carBrand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}car_brand'])!,
      carModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}car_model'])!,
      releaseYear: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_year'])!,
      registrationNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}registration_number'])!,
      firstAndLastName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}first_and_last_name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      carDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}car_date']),
      worksList: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}works_list'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
    );
  }

  @override
  $CarTableTable createAlias(String alias) {
    return $CarTableTable(attachedDatabase, alias);
  }
}

class CarTableData extends DataClass implements Insertable<CarTableData> {
  final int id;
  final Uint8List photo;
  final String carBrand;
  final String carModel;
  final String releaseYear;
  final String registrationNumber;
  final String firstAndLastName;
  final String phoneNumber;
  final DateTime? carDate;
  final String worksList;
  final String comment;
  const CarTableData(
      {required this.id,
      required this.photo,
      required this.carBrand,
      required this.carModel,
      required this.releaseYear,
      required this.registrationNumber,
      required this.firstAndLastName,
      required this.phoneNumber,
      this.carDate,
      required this.worksList,
      required this.comment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['photo'] = Variable<Uint8List>(photo);
    map['car_brand'] = Variable<String>(carBrand);
    map['car_model'] = Variable<String>(carModel);
    map['release_year'] = Variable<String>(releaseYear);
    map['registration_number'] = Variable<String>(registrationNumber);
    map['first_and_last_name'] = Variable<String>(firstAndLastName);
    map['phone_number'] = Variable<String>(phoneNumber);
    if (!nullToAbsent || carDate != null) {
      map['car_date'] = Variable<DateTime>(carDate);
    }
    map['works_list'] = Variable<String>(worksList);
    map['comment'] = Variable<String>(comment);
    return map;
  }

  CarTableCompanion toCompanion(bool nullToAbsent) {
    return CarTableCompanion(
      id: Value(id),
      photo: Value(photo),
      carBrand: Value(carBrand),
      carModel: Value(carModel),
      releaseYear: Value(releaseYear),
      registrationNumber: Value(registrationNumber),
      firstAndLastName: Value(firstAndLastName),
      phoneNumber: Value(phoneNumber),
      carDate: carDate == null && nullToAbsent
          ? const Value.absent()
          : Value(carDate),
      worksList: Value(worksList),
      comment: Value(comment),
    );
  }

  factory CarTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CarTableData(
      id: serializer.fromJson<int>(json['id']),
      photo: serializer.fromJson<Uint8List>(json['photo']),
      carBrand: serializer.fromJson<String>(json['carBrand']),
      carModel: serializer.fromJson<String>(json['carModel']),
      releaseYear: serializer.fromJson<String>(json['releaseYear']),
      registrationNumber:
          serializer.fromJson<String>(json['registrationNumber']),
      firstAndLastName: serializer.fromJson<String>(json['firstAndLastName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      carDate: serializer.fromJson<DateTime?>(json['carDate']),
      worksList: serializer.fromJson<String>(json['worksList']),
      comment: serializer.fromJson<String>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'photo': serializer.toJson<Uint8List>(photo),
      'carBrand': serializer.toJson<String>(carBrand),
      'carModel': serializer.toJson<String>(carModel),
      'releaseYear': serializer.toJson<String>(releaseYear),
      'registrationNumber': serializer.toJson<String>(registrationNumber),
      'firstAndLastName': serializer.toJson<String>(firstAndLastName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'carDate': serializer.toJson<DateTime?>(carDate),
      'worksList': serializer.toJson<String>(worksList),
      'comment': serializer.toJson<String>(comment),
    };
  }

  CarTableData copyWith(
          {int? id,
          Uint8List? photo,
          String? carBrand,
          String? carModel,
          String? releaseYear,
          String? registrationNumber,
          String? firstAndLastName,
          String? phoneNumber,
          Value<DateTime?> carDate = const Value.absent(),
          String? worksList,
          String? comment}) =>
      CarTableData(
        id: id ?? this.id,
        photo: photo ?? this.photo,
        carBrand: carBrand ?? this.carBrand,
        carModel: carModel ?? this.carModel,
        releaseYear: releaseYear ?? this.releaseYear,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        firstAndLastName: firstAndLastName ?? this.firstAndLastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        carDate: carDate.present ? carDate.value : this.carDate,
        worksList: worksList ?? this.worksList,
        comment: comment ?? this.comment,
      );
  @override
  String toString() {
    return (StringBuffer('CarTableData(')
          ..write('id: $id, ')
          ..write('photo: $photo, ')
          ..write('carBrand: $carBrand, ')
          ..write('carModel: $carModel, ')
          ..write('releaseYear: $releaseYear, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('firstAndLastName: $firstAndLastName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('carDate: $carDate, ')
          ..write('worksList: $worksList, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      $driftBlobEquality.hash(photo),
      carBrand,
      carModel,
      releaseYear,
      registrationNumber,
      firstAndLastName,
      phoneNumber,
      carDate,
      worksList,
      comment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarTableData &&
          other.id == this.id &&
          $driftBlobEquality.equals(other.photo, this.photo) &&
          other.carBrand == this.carBrand &&
          other.carModel == this.carModel &&
          other.releaseYear == this.releaseYear &&
          other.registrationNumber == this.registrationNumber &&
          other.firstAndLastName == this.firstAndLastName &&
          other.phoneNumber == this.phoneNumber &&
          other.carDate == this.carDate &&
          other.worksList == this.worksList &&
          other.comment == this.comment);
}

class CarTableCompanion extends UpdateCompanion<CarTableData> {
  final Value<int> id;
  final Value<Uint8List> photo;
  final Value<String> carBrand;
  final Value<String> carModel;
  final Value<String> releaseYear;
  final Value<String> registrationNumber;
  final Value<String> firstAndLastName;
  final Value<String> phoneNumber;
  final Value<DateTime?> carDate;
  final Value<String> worksList;
  final Value<String> comment;
  const CarTableCompanion({
    this.id = const Value.absent(),
    this.photo = const Value.absent(),
    this.carBrand = const Value.absent(),
    this.carModel = const Value.absent(),
    this.releaseYear = const Value.absent(),
    this.registrationNumber = const Value.absent(),
    this.firstAndLastName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.carDate = const Value.absent(),
    this.worksList = const Value.absent(),
    this.comment = const Value.absent(),
  });
  CarTableCompanion.insert({
    this.id = const Value.absent(),
    required Uint8List photo,
    required String carBrand,
    required String carModel,
    required String releaseYear,
    required String registrationNumber,
    required String firstAndLastName,
    required String phoneNumber,
    this.carDate = const Value.absent(),
    required String worksList,
    required String comment,
  })  : photo = Value(photo),
        carBrand = Value(carBrand),
        carModel = Value(carModel),
        releaseYear = Value(releaseYear),
        registrationNumber = Value(registrationNumber),
        firstAndLastName = Value(firstAndLastName),
        phoneNumber = Value(phoneNumber),
        worksList = Value(worksList),
        comment = Value(comment);
  static Insertable<CarTableData> custom({
    Expression<int>? id,
    Expression<Uint8List>? photo,
    Expression<String>? carBrand,
    Expression<String>? carModel,
    Expression<String>? releaseYear,
    Expression<String>? registrationNumber,
    Expression<String>? firstAndLastName,
    Expression<String>? phoneNumber,
    Expression<DateTime>? carDate,
    Expression<String>? worksList,
    Expression<String>? comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (photo != null) 'photo': photo,
      if (carBrand != null) 'car_brand': carBrand,
      if (carModel != null) 'car_model': carModel,
      if (releaseYear != null) 'release_year': releaseYear,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (firstAndLastName != null) 'first_and_last_name': firstAndLastName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (carDate != null) 'car_date': carDate,
      if (worksList != null) 'works_list': worksList,
      if (comment != null) 'comment': comment,
    });
  }

  CarTableCompanion copyWith(
      {Value<int>? id,
      Value<Uint8List>? photo,
      Value<String>? carBrand,
      Value<String>? carModel,
      Value<String>? releaseYear,
      Value<String>? registrationNumber,
      Value<String>? firstAndLastName,
      Value<String>? phoneNumber,
      Value<DateTime?>? carDate,
      Value<String>? worksList,
      Value<String>? comment}) {
    return CarTableCompanion(
      id: id ?? this.id,
      photo: photo ?? this.photo,
      carBrand: carBrand ?? this.carBrand,
      carModel: carModel ?? this.carModel,
      releaseYear: releaseYear ?? this.releaseYear,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      firstAndLastName: firstAndLastName ?? this.firstAndLastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      carDate: carDate ?? this.carDate,
      worksList: worksList ?? this.worksList,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (photo.present) {
      map['photo'] = Variable<Uint8List>(photo.value);
    }
    if (carBrand.present) {
      map['car_brand'] = Variable<String>(carBrand.value);
    }
    if (carModel.present) {
      map['car_model'] = Variable<String>(carModel.value);
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
    if (carDate.present) {
      map['car_date'] = Variable<DateTime>(carDate.value);
    }
    if (worksList.present) {
      map['works_list'] = Variable<String>(worksList.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarTableCompanion(')
          ..write('id: $id, ')
          ..write('photo: $photo, ')
          ..write('carBrand: $carBrand, ')
          ..write('carModel: $carModel, ')
          ..write('releaseYear: $releaseYear, ')
          ..write('registrationNumber: $registrationNumber, ')
          ..write('firstAndLastName: $firstAndLastName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('carDate: $carDate, ')
          ..write('worksList: $worksList, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppCarDatabase extends GeneratedDatabase {
  _$AppCarDatabase(QueryExecutor e) : super(e);
  late final $CarTableTable carTable = $CarTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [carTable];
}
