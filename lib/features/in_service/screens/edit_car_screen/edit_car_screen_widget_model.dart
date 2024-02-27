import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/in_service/screens/edit_car_screen/edit_car_screen.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_car_screen_model.dart';

EditCarScreenWidgetModel editCarScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = EditCarScreenModel(
    appScope.carsService,
  );
  final router = appDependencies.router;
  return EditCarScreenWidgetModel(model, router);
}

class EditCarScreenWidgetModel extends WidgetModel<EditCarScreen, EditCarScreenModel> implements IEditCarScreenWidgetModel {
  final AppRouter router;

  EditCarScreenWidgetModel(
    super._model,
    this.router,
  );

  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _firstAndLastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _worksListController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();
  final _dateTimeState = ValueNotifier<DateTime?>(null);
  final _carState = ValueNotifier<CarData>(CarData.init());

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

  final _carBrandMessageState = ValueNotifier<String?>(null);
  final _dateTimeMessageState = ValueNotifier<String?>(null);
  final _releaseYearMessageState = ValueNotifier<String?>(null);

  @override
  void initWidgetModel() {
    final args = router.current.args is EditCarRouterArgs ? router.current.args! as EditCarRouterArgs : null;

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

    if (args != null) {
      _registrationNumberController.text = args.car.registrationNumber;
      _firstAndLastNameController.text = args.car.firstAndLastName;
      _phoneNumberController.text = args.car.phoneNumber;
      _worksListController.text = args.car.worksList;
      _commentController.text = args.car.comment;
      _carModelController.text = args.car.carModel;
      model
        ..photo = args.car.photo
        ..id = args.car.id
        ..carDate = args.car.carDate
        ..releaseYear = args.car.releaseYear
        ..carBrand = args.car.carBrand;
      _dateTimeState.value = model.car.carDate;
      _carState.value = model.car;
    }

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
  Future<void> savePhoto(Uint8List photo) async {
    model.photo = photo;
    _carState.value = model.car;
  }

  @override
  Future<void> saveCarBrand(String carBrand) async {
    model.carBrand = carBrand;
    _carState.value = model.car;
  }

  @override
  Future<void> saveReleaseYear(String releaseYear) async {
    model.releaseYear = releaseYear;
    _carState.value = model.car;
  }

  @override
  void addDate(DateTime? date) {
    model.carDate = date;
    _carState.value = model.car;
    _dateTimeState.value = date;
  }

  @override
  Future<void> editCar() async {
    await model.editCar();
    final args = router.current.args is EditCarRouterArgs ? router.current.args! as EditCarRouterArgs : null;

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
    if (!isReleaseYearCorrect) {
      _carBrandMessageState.value = 'error';
    }

    if (isRegistrationNumberCorrect && isDateTimeCorrect && isFirstAndLastNameCorrect && isPhoneNumberCorrect && isCarBrandCorrect) {
      args?.refreshCar?.call(model.car);
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
  ValueNotifier<DateTime?> get dateTimeState => _dateTimeState;

  @override
  ValueNotifier<CarData> get carState => _carState;

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
  GlobalKey<FormState> get formDateTimeKey => _formDateTimeKey;

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
}

abstract class IEditCarScreenWidgetModel implements IWidgetModel {
  Future<void> editCar();

  void closeScreen() {}

  void savePhoto(Uint8List photo);

  void addDate(DateTime? date);

  void saveCarBrand(String carModel);

  void saveReleaseYear(String releaseYear);

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

  TextEditingController get registrationNumberController;

  TextEditingController get firstAndLastNameController;

  TextEditingController get phoneNumberController;

  TextEditingController get worksListController;

  TextEditingController get commentController;

  TextEditingController get carModelController;

  ValueNotifier<CarData> get carState;

  ValueNotifier<DateTime?> get dateTimeState;
}
