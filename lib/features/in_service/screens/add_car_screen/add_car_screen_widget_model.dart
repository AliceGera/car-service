import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_car_screen.dart';
import 'add_car_screen_model.dart';

AddCarScreenWidgetModel addCarScreenWmFactory(
  BuildContext context,
) {
  final model = AddCarScreenModel();
  final appScope = context.read<IAppScope>();
  return AddCarScreenWidgetModel(
    model,
    appScope.router,
  );
}

class AddCarScreenWidgetModel extends WidgetModel<AddCarScreen, AddCarScreenModel> implements IAddCarScreenWidgetModel {
  final AppRouter router;

  AddCarScreenWidgetModel(
    super._model,
    this.router,
  );

  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _firstAndLastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _worksListController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  final GlobalKey<FormState> _formRegistrationNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formFirstAndLastNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPhoneNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formWorksListKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formCommentKey = GlobalKey<FormState>();

  String? _registrationNumberValidationText;
  String? _firstAndLastNameValidationText;
  String? _phoneNumberValidationText;
  String? _worksListValidationText;
  String? _commentValidationText;

  final _dateTimeState = ValueNotifier<DateTime?>(null);
  final _dateTimeMessageState = ValueNotifier<String?>(null);

  final GlobalKey<FormState> _formDateTimeKey = GlobalKey<FormState>();

  String? _dateTimeValidationText;

  @override
  void initWidgetModel() {
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
    _worksListController.addListener(() {
      if (_worksListValidationText != null && _worksListValidationText!.isNotEmpty) {
        _worksListValidationText = null;
        _formWorksListKey.currentState?.validate();
      }
      model.worksList = _worksListController.text;
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
    model.holidayDate = date;
    _dateTimeState.value = date;
    _dateTimeMessageState.value = null;
  }

  @override
  void dispose() {
    _registrationNumberController.dispose();
    _firstAndLastNameController.dispose();
    _phoneNumberController.dispose();
    _worksListController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
  }

  @override
  Future<void> savePhoto(Uint8List photo) async {
    model.photo = photo;
  }

  @override
  Future<void> addCar() async {
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
    final isWorksListCorrect = _worksListController.text.isNotEmpty;
    if (!isWorksListCorrect) {
      _worksListValidationText = 'error';
      _formWorksListKey.currentState?.validate();
    }
    final isCommentCorrect = _commentController.text.isNotEmpty;
    if (!isCommentCorrect) {
      _commentValidationText = 'error';
      _formCommentKey.currentState?.validate();
    }
    final isDateTimeCorrect = _dateTimeState.value != null;
    if (!isDateTimeCorrect) {
      _dateTimeMessageState.value = 'error';
    }
    if (isRegistrationNumberCorrect && isDateTimeCorrect && isFirstAndLastNameCorrect && isPhoneNumberCorrect && isCommentCorrect) {
      await model.addCar();
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
  TextEditingController get worksListController => _worksListController;

  @override
  TextEditingController get commentController => _commentController;

  @override
  GlobalKey<FormState> get formRegistrationNumberKey => _formRegistrationNumberKey;

  @override
  GlobalKey<FormState> get formFirstAndLastNameKey => _formFirstAndLastNameKey;

  @override
  GlobalKey<FormState> get formPhoneNumberKey => _formPhoneNumberKey;

  @override
  GlobalKey<FormState> get formWorksListKey => _formWorksListKey;

  @override
  GlobalKey<FormState> get formCommentKey => _formCommentKey;

  @override
  String? getRegistrationNumberValidationText() => _registrationNumberValidationText;

  @override
  String? getFirstAndLastNameValidationText() => _firstAndLastNameValidationText;

  @override
  String? getPhoneNumberValidationText() => _phoneNumberValidationText;

  @override
  String? getWorksListValidationText() => _worksListValidationText;

  @override
  String? getCommentValidationText() => _commentValidationText;

  @override
  String? getDateTimeValidationText() => _dateTimeValidationText;

  @override
  GlobalKey<FormState> get formDateTimeKey => _formDateTimeKey;

  @override
  ValueNotifier<DateTime?> get dateTimeState => _dateTimeState;

  @override
  ValueNotifier<String?> get dateTimeMessageState => _dateTimeMessageState;
}

abstract interface class IAddCarScreenWidgetModel implements IWidgetModel {

  TextEditingController get registrationNumberController;

  TextEditingController get firstAndLastNameController;

  TextEditingController get phoneNumberController;

  TextEditingController get worksListController;

  TextEditingController get commentController;

  GlobalKey<FormState> get formRegistrationNumberKey;

  GlobalKey<FormState> get formFirstAndLastNameKey;

  GlobalKey<FormState> get formPhoneNumberKey;

  GlobalKey<FormState> get formWorksListKey;

  GlobalKey<FormState> get formCommentKey;

  GlobalKey<FormState> get formDateTimeKey;

  String? getRegistrationNumberValidationText();

  String? getFirstAndLastNameValidationText();

  String? getPhoneNumberValidationText();

  String? getWorksListValidationText();

  String? getCommentValidationText();

  ValueNotifier<DateTime?> get dateTimeState;

  ValueNotifier<String?> get dateTimeMessageState;

  void closeScreen();

  void addDate(DateTime? date);

  void savePhoto(Uint8List photo);

  Future<void> addCar();
}
