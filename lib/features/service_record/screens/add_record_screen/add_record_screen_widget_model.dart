import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/service_record/screens/add_record_screen/add_record_screen.dart';
import 'package:car_service/features/service_record/screens/add_record_screen/add_record_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AddRecordScreenWidgetModel addRecordScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = AddRecordScreenModel(
    appScope.recordsService,
  );

  return AddRecordScreenWidgetModel(
    model,
    appScope.router,
  );
}

class AddRecordScreenWidgetModel extends WidgetModel<AddRecordScreen, AddRecordScreenModel> implements IAddRecordScreenWidgetModel {
  final AppRouter router;

  AddRecordScreenWidgetModel(
    super._model,
    this.router,
  );

  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _firstAndLastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _recordModelController = TextEditingController();

  final GlobalKey<FormState> _formRegistrationNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formFirstAndLastNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPhoneNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formCommentKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formRecordModelKey = GlobalKey<FormState>();

  String? _recordModelValidationText;
  String? _registrationNumberValidationText;
  String? _firstAndLastNameValidationText;
  String? _phoneNumberValidationText;
  String? _commentValidationText;

  final _recordTimeMessageState = ValueNotifier<String?>(null);
  final _recordDateMessageState = ValueNotifier<String?>(null);
  final _recordState = ValueNotifier<RecordData>(RecordData.init());

  @override
  void initWidgetModel() {
    _recordModelController.addListener(() {
      if (_recordModelValidationText != null && _recordModelValidationText!.isNotEmpty) {
        _recordModelValidationText = null;
        _formRecordModelKey.currentState?.validate();
      }
      model.recordModel = _recordModelController.text;
    });
    _registrationNumberController.addListener(() {
      if (_registrationNumberValidationText != null && _registrationNumberValidationText!.isNotEmpty) {
        _registrationNumberValidationText = null;
        _formRegistrationNumberKey.currentState?.validate();
      }
      model.registrationNumber = _registrationNumberController.text;
    });
    _firstAndLastNameController.addListener(() {
      if (_firstAndLastNameValidationText != null && _firstAndLastNameValidationText!.isNotEmpty) {
        _firstAndLastNameValidationText = null;
        _formFirstAndLastNameKey.currentState?.validate();
      }
      model.firstAndLastName = _firstAndLastNameController.text;
    });
    _phoneNumberController.addListener(() {
      if (_phoneNumberValidationText != null && _phoneNumberValidationText!.isNotEmpty) {
        _phoneNumberValidationText = null;
        _formPhoneNumberKey.currentState?.validate();
      }
      model.phoneNumber = _phoneNumberController.text;
    });

    _commentController.addListener(() {
      if (_commentValidationText != null && _commentValidationText!.isNotEmpty) {
        _commentValidationText = null;
        _formCommentKey.currentState?.validate();
      }
      model.comment = _commentController.text;
    });

    super.initWidgetModel();
  }

  @override
  void addDate(DateTime? date) {
    model.recordDate = date;
    _recordState.value = model.record;
    _recordDateMessageState.value = null;
  }

  @override
  void addTime(DateTime? date) {
    model.recordTime = date;
    recordState.value = model.record;
    _recordTimeMessageState.value = null;
  }

  @override
  void dispose() {
    _registrationNumberController.dispose();
    _firstAndLastNameController.dispose();
    _phoneNumberController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
  }

  @override
  Future<void> saveRecordBrand(String recordBrand) async {
    model.recordBrand = recordBrand;
    _recordState.value = model.record;
  }

  @override
  Future<void> saveReleaseYear(String releaseYear) async {
    model.releaseYear = releaseYear;
    _recordState.value = model.record;
  }

  @override
  Future<void> addRecord() async {
    final isRecordModelCorrect = _recordModelController.text.isNotEmpty;
    if (!isRecordModelCorrect) {
      _recordModelValidationText = 'error';
      _formRecordModelKey.currentState?.validate();
    }
    final isRegistrationNumberCorrect = _registrationNumberController.text.isNotEmpty;
    if (!isRegistrationNumberCorrect) {
      _registrationNumberValidationText = 'error';
      _formRegistrationNumberKey.currentState?.validate();
    }
    final isFirstAndLastNameCorrect = _firstAndLastNameController.text.isNotEmpty;
    if (!isFirstAndLastNameCorrect) {
      _firstAndLastNameValidationText = 'error';
      _formFirstAndLastNameKey.currentState?.validate();
    }
    final isPhoneNumberCorrect = _phoneNumberController.text.isNotEmpty;
    if (!isPhoneNumberCorrect) {
      _phoneNumberValidationText = 'error';
      _formPhoneNumberKey.currentState?.validate();
    }
    final isCommentCorrect = _commentController.text.isNotEmpty;
    if (!isCommentCorrect) {
      _commentValidationText = 'error';
      _formCommentKey.currentState?.validate();
    }
    final isRecordDateCorrect = model.record.recordDate != null;
    if (!isRecordDateCorrect) {
      _recordDateMessageState.value = 'error';
    }
    final isRecordTimeCorrect = model.record.recordDate != null;
    if (!isRecordTimeCorrect) {
      _recordTimeMessageState.value = 'error';
    }
    if (isRegistrationNumberCorrect && isRecordDateCorrect && isFirstAndLastNameCorrect && isPhoneNumberCorrect && isRecordModelCorrect) {
      await model.addRecord();
      await router.pop();
    }
  }

  @override
  TextEditingController get registrationNumberController => _registrationNumberController;

  @override
  TextEditingController get firstAndLastNameController => _firstAndLastNameController;

  @override
  TextEditingController get phoneNumberController => _phoneNumberController;

  @override
  TextEditingController get commentController => _commentController;

  @override
  TextEditingController get recordModelController => _recordModelController;

  @override
  GlobalKey<FormState> get formRegistrationNumberKey => _formRegistrationNumberKey;

  @override
  GlobalKey<FormState> get formFirstAndLastNameKey => _formFirstAndLastNameKey;

  @override
  GlobalKey<FormState> get formPhoneNumberKey => _formPhoneNumberKey;

  @override
  GlobalKey<FormState> get formCommentKey => _formCommentKey;

  @override
  GlobalKey<FormState> get formRecordModelKey => _formRecordModelKey;

  @override
  String? getRegistrationNumberValidationText() => _registrationNumberValidationText;

  @override
  String? getFirstAndLastNameValidationText() => _firstAndLastNameValidationText;

  @override
  String? getPhoneNumberValidationText() => _phoneNumberValidationText;

  @override
  String? getCommentValidationText() => _commentValidationText;

  @override
  String? getRecordModelValidationText() => _recordModelValidationText;

  @override
  ValueNotifier<String?> get recordTimeMessageState => _recordTimeMessageState;

  @override
  ValueNotifier<String?> get recordDateMessageState => _recordDateMessageState;

  @override
  ValueNotifier<RecordData> get recordState => _recordState;
}

abstract interface class IAddRecordScreenWidgetModel implements IWidgetModel {
  TextEditingController get registrationNumberController;

  TextEditingController get firstAndLastNameController;

  TextEditingController get phoneNumberController;

  TextEditingController get commentController;

  TextEditingController get recordModelController;

  GlobalKey<FormState> get formRecordModelKey;

  GlobalKey<FormState> get formRegistrationNumberKey;

  GlobalKey<FormState> get formFirstAndLastNameKey;

  GlobalKey<FormState> get formPhoneNumberKey;

  GlobalKey<FormState> get formCommentKey;

  String? getRegistrationNumberValidationText();

  String? getFirstAndLastNameValidationText();

  String? getPhoneNumberValidationText();

  String? getCommentValidationText();

  String? getRecordModelValidationText();

  ValueNotifier<String?> get recordDateMessageState;

  ValueNotifier<String?> get recordTimeMessageState;

  ValueNotifier<RecordData> get recordState;

  void closeScreen();

  void addDate(DateTime? date);

  void saveRecordBrand(String recordModel);

  void saveReleaseYear(String releaseYear);

  Future<void> addRecord();

  void addTime(DateTime? date);
}
