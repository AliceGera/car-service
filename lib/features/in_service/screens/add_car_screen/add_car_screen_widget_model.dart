import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
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
  final appScope = context.read<IAppScope>();
  final model = AddCarScreenModel(
    appScope.carsService,
  );

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
  final TextEditingController _carModelController = TextEditingController();

  final GlobalKey<FormState> _formRegistrationNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formFirstAndLastNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPhoneNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formWorksListKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formCommentKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formCarModelKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formDateTimeKey = GlobalKey<FormState>();

  String? _registrationNumberValidationText;
  String? _firstAndLastNameValidationText;
  String? _phoneNumberValidationText;
  String? _worksListValidationText;
  String? _commentValidationText;
  String? _carModelValidationText;
  String? _dateTimeValidationText;
  final _carBrandMessageState = ValueNotifier<String?>(null);
  final _dateTimeMessageState = ValueNotifier<String?>(null);
  final _releaseYearMessageState = ValueNotifier<String?>(null);
  final _carState = ValueNotifier<CarData>(CarData.init());

  @override
  void initWidgetModel() {
    _registrationNumberController.addListener(() {
      if (_registrationNumberValidationText != null && _registrationNumberValidationText!.isNotEmpty) {
        _registrationNumberValidationText = null;
        _formRegistrationNumberKey.currentState?.validate();
      }
      model.registrationNumber = _registrationNumberController.text;
      _carState.value = model.car;
    });
    _firstAndLastNameController.addListener(() {
      if (_firstAndLastNameValidationText != null && _firstAndLastNameValidationText!.isNotEmpty) {
        _firstAndLastNameValidationText = null;
        _formFirstAndLastNameKey.currentState?.validate();
      }
      model.firstAndLastName = _firstAndLastNameController.text;
      _carState.value = model.car;
    });
    _phoneNumberController.addListener(() {
      if (_phoneNumberValidationText != null && _phoneNumberValidationText!.isNotEmpty) {
        _phoneNumberValidationText = null;
        _formPhoneNumberKey.currentState?.validate();
      }
      model.phoneNumber = _phoneNumberController.text;
      _carState.value = model.car;
    });
    _worksListController.addListener(() {
      if (_worksListValidationText != null && _worksListValidationText!.isNotEmpty) {
        _worksListValidationText = null;
        _formWorksListKey.currentState?.validate();
      }
      model.worksList = _worksListController.text;
      _carState.value = model.car;
    });
    _commentController.addListener(() {
      if (_commentValidationText != null && _commentValidationText!.isNotEmpty) {
        _commentValidationText = null;
        _formCommentKey.currentState?.validate();
      }
      model.comment = _commentController.text;
      _carState.value = model.car;
    });
    _carModelController.addListener(() {
      if (_carModelValidationText != null && _carModelValidationText!.isNotEmpty) {
        _carModelValidationText = null;
        _formCarModelKey.currentState?.validate();
      }
      model.carModel = _carModelController.text;
      _carState.value = model.car;
    });

    super.initWidgetModel();
  }

  @override
  void dispose() {
    _registrationNumberController.dispose();
    _firstAndLastNameController.dispose();
    _phoneNumberController.dispose();
    _worksListController.dispose();
    _commentController.dispose();
    _carModelController.dispose();
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
  }

  @override
  void addDate(DateTime? date) {
    model.carDate = date;
    _carState.value = model.car;
    _dateTimeMessageState.value = null;
  }

  @override
  Future<void> savePhoto(Uint8List photo) async {
    model.photo = photo;
  }

  @override
  Future<void> saveCarBrand(String carBrand) async {
    model.carBrand = carBrand;
    _carState.value = model.car;
    _carBrandMessageState.value = null;
  }

  @override
  Future<void> saveReleaseYear(String releaseYear) async {
    model.releaseYear = releaseYear;
    _carState.value = model.car;
    _releaseYearMessageState.value = null;
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

    final isCarModelCorrect = _carModelController.text.isNotEmpty;
    if (!isCarModelCorrect) {
      _carModelValidationText = 'error';
      _formCarModelKey.currentState?.validate();
    }
    final isDateTimeCorrect = model.car.carDate != null;
    if (!isDateTimeCorrect) {
      _dateTimeMessageState.value = 'error';
    }
    final isReleaseYearCorrect = model.car.releaseYear.isNotEmpty;
    if (!isReleaseYearCorrect) {
      _releaseYearMessageState.value = 'error';
    }
    final isCarBrandCorrect = model.car.carBrand.isNotEmpty;
    if (!isCarBrandCorrect) {
      _carBrandMessageState.value = 'error';
    }

    final isCanCave = isRegistrationNumberCorrect &&
        isFirstAndLastNameCorrect &&
        isPhoneNumberCorrect &&
        isWorksListCorrect &&
        isCarModelCorrect &&
        isDateTimeCorrect &&
        isReleaseYearCorrect  &&
        isCarBrandCorrect ;
    if (isCanCave) {
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
  TextEditingController get carModelController => _carModelController;

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
  GlobalKey<FormState> get formCarModelKey => _formCarModelKey;

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
  String? getCarModelValidationText() => _carModelValidationText;

  @override
  String? getDateTimeValidationText() => _dateTimeValidationText;

  @override
  GlobalKey<FormState> get formDateTimeKey => _formDateTimeKey;

  @override
  ValueNotifier<String?> get dateTimeMessageState => _dateTimeMessageState;

  @override
  ValueNotifier<String?> get carBrandMessageState => _carBrandMessageState;

  @override
  ValueNotifier<String?> get releaseYearMessageState => _releaseYearMessageState;

  @override
  ValueNotifier<CarData> get carState => _carState;
}

abstract interface class IAddCarScreenWidgetModel implements IWidgetModel {
  TextEditingController get registrationNumberController;

  TextEditingController get firstAndLastNameController;

  TextEditingController get phoneNumberController;

  TextEditingController get worksListController;

  TextEditingController get commentController;

  TextEditingController get carModelController;

  GlobalKey<FormState> get formRegistrationNumberKey;

  GlobalKey<FormState> get formFirstAndLastNameKey;

  GlobalKey<FormState> get formPhoneNumberKey;

  GlobalKey<FormState> get formWorksListKey;

  GlobalKey<FormState> get formCommentKey;

  GlobalKey<FormState> get formDateTimeKey;

  GlobalKey<FormState> get formCarModelKey;

  String? getRegistrationNumberValidationText();

  String? getFirstAndLastNameValidationText();

  String? getPhoneNumberValidationText();

  String? getWorksListValidationText();

  String? getCommentValidationText();

  String? getCarModelValidationText();

  ValueNotifier<String?> get dateTimeMessageState;

  ValueNotifier<String?> get releaseYearMessageState;

  ValueNotifier<String?> get carBrandMessageState;

  ValueNotifier<CarData> get carState;

  void closeScreen();

  void addDate(DateTime? date);

  void savePhoto(Uint8List photo);

  void saveCarBrand(String carModel);

  void saveReleaseYear(String releaseYear);

  Future<void> addCar();
}
