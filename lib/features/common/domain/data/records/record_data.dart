class RecordData {
  final int id;
  final String recordBrand;
  final String recordModel;
  final String releaseYear;
  final String registrationNumber;
  final String firstAndLastName;
  final String phoneNumber;
  final DateTime? recordDate;
  final DateTime? recordTime;
  final String comment;

  RecordData({
    required this.id,
    required this.recordBrand,
    required this.recordModel,
    required this.releaseYear,
    required this.registrationNumber,
    required this.firstAndLastName,
    required this.phoneNumber,
    required this.comment,
    this.recordDate,
    this.recordTime,
  });

  static RecordData init() => RecordData(
        id: 0,
        recordBrand: '',
        recordModel: '',
        releaseYear: '',
        registrationNumber: '',
        firstAndLastName: '',
        phoneNumber: '',
        comment: '',
      );

  RecordData copyWith({
    int? id,
    String? recordBrand,
    String? recordModel,
    String? releaseYear,
    String? registrationNumber,
    String? firstAndLastName,
    String? phoneNumber,
    DateTime? recordDate,
    DateTime? recordTime,
    String? comment,
  }) {
    return RecordData(
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
}
