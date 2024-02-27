import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/service_record/screens/edit_record_screen/edit_record_screen.dart';
import 'package:car_service/features/service_record/screens/edit_record_screen/edit_record_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

EditRecordScreenWidgetModel editRecordScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = EditRecordScreenModel(
    appScope.recordsService,
  );
  final router = appDependencies.router;
  return EditRecordScreenWidgetModel(model, router);
}

class EditRecordScreenWidgetModel extends WidgetModel<EditRecordScreen, EditRecordScreenModel> implements IEditRecordScreenWidgetModel {
  final AppRouter router;

  EditRecordScreenWidgetModel(
    super._model,
    this.router,
  );

  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _firstAndLastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _recordModelController = TextEditingController();
  final _recordState = ValueNotifier<RecordData>(RecordData.init());

  @override
  void initWidgetModel() {
    final args = router.current.args is EditRecordRouterArgs ? router.current.args! as EditRecordRouterArgs : null;
    _recordModelController.addListener(() {
      model.recordModel = _recordModelController.text;
      _recordState.value = model.record;
    });
    _registrationNumberController.addListener(() {
      model.registrationNumber = _registrationNumberController.text;
      _recordState.value = model.record;
    });
    _firstAndLastNameController.addListener(() {
      model.firstAndLastName = _firstAndLastNameController.text;
      _recordState.value = model.record;
    });
    _phoneNumberController.addListener(() {
      model.phoneNumber = _phoneNumberController.text;
      _recordState.value = model.record;
    });

    if (args != null) {
      _registrationNumberController.text = args.record.registrationNumber;
      _firstAndLastNameController.text = args.record.firstAndLastName;
      _phoneNumberController.text = args.record.phoneNumber;
      _commentController.text = args.record.comment;
      _recordModelController.text = args.record.recordModel;
      model
        ..recordDate = args.record.recordDate
        ..recordTime = args.record.recordTime
        ..releaseYear = args.record.releaseYear
        ..recordBrand = args.record.recordBrand
        ..recordModel = args.record.recordModel
        ..recordId = args.record.id;
      _recordState.value = model.record;
    }
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _registrationNumberController.dispose();
    _firstAndLastNameController.dispose();
    _phoneNumberController.dispose();
    _recordModelController.dispose();
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
  void addDate(DateTime? date) {
    model.recordDate = date;
    _recordState.value = model.record;
  }

  @override
  void addTime(DateTime? date) {
    model.recordTime = date;
    recordState.value = model.record;
  }

  @override
  Future<void> editRecord() async {
    await model.editRecord();
    await router.pop();
  }

  @override
  TextEditingController get registrationNumberController => _registrationNumberController;

  @override
  TextEditingController get firstAndLastNameController => _firstAndLastNameController;

  @override
  TextEditingController get phoneNumberController => _phoneNumberController;

  @override
  TextEditingController get recordModelController => _recordModelController;

  @override
  TextEditingController get commentController => _commentController;

  @override
  ValueNotifier<RecordData> get recordState => _recordState;
}

abstract class IEditRecordScreenWidgetModel implements IWidgetModel {
  void closeScreen();

  void addTime(DateTime? date);

  void addDate(DateTime? date);

  void saveRecordBrand(String recordModel);

  void saveReleaseYear(String releaseYear);

  Future<void> editRecord();

  ValueNotifier<RecordData> get recordState;

  TextEditingController get registrationNumberController;

  TextEditingController get firstAndLastNameController;

  TextEditingController get phoneNumberController;

  TextEditingController get recordModelController;

  TextEditingController get commentController;
}
