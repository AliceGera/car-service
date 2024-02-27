import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';
import 'add_object_screen.dart';
import 'add_object_screen_model.dart';

AddObjectWidgetModel addObjectWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = AddObjectScreenModel(
    appScope.objectsService,
    appScope.objectTypesService,
  );
  final router = appDependencies.router;
  return AddObjectWidgetModel(model, router);
}

class AddObjectWidgetModel extends WidgetModel<AddObjectScreen, AddObjectScreenModel> implements IAddObjectWidgetModel {
  final AppRouter router;

  AddObjectWidgetModel(
    super._model,
    this.router,
  );

  final _objectsState = UnionStateNotifier<ObjectData>(ObjectData.init());
  final TextEditingController _objectTypeController = TextEditingController();
  final TextEditingController _objectNameController = TextEditingController();
  final TextEditingController _objectCountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formObjectTypeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formObjectNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formObjectCountKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formDescriptionKey = GlobalKey<FormState>();

  String? _objectNameValidationText;
  String? _objectTypeValidationText;
  String? _objectCountValidationText;
  String? _descriptionValidationText;
  final _measureUnitMessageState = ValueNotifier<String?>(null);

  @override
  void initWidgetModel() {
    _objectTypeController.addListener(() {
      if (_objectTypeValidationText != null && _objectTypeController.text.isNotEmpty) {
        _objectTypeValidationText = null;
        _formObjectTypeKey.currentState?.validate();
      }
      model.objectTypeName = _objectTypeController.text;
    });
    _objectNameController.addListener(() {
      if (_objectNameValidationText != null && _objectNameController.text.isNotEmpty) {
        _objectNameValidationText = null;
        _formObjectNameKey.currentState?.validate();
      }
      model.objectName = _objectNameController.text;
    });
    _objectCountController.addListener(() {
      if (_objectCountValidationText != null && _objectCountController.text.isNotEmpty) {
        _objectCountValidationText = null;
        _formObjectCountKey.currentState?.validate();
      }
      model.objectCount = _objectCountController.text;
    });
    _descriptionController.addListener(() {
      if (_descriptionValidationText != null && _descriptionController.text.isNotEmpty) {
        _descriptionValidationText = null;
        _formDescriptionKey.currentState?.validate();
      }
      model.description = _descriptionController.text;
    });
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _objectTypeController.dispose();
    _objectNameController.dispose();
    _objectCountController.dispose();
    _descriptionController.dispose();
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
  Future<void> addObject() async {
    final isObjectNameCorrect = _objectNameController.text.isNotEmpty;
    if (!isObjectNameCorrect) {
      _objectNameValidationText = 'error';
      _formObjectNameKey.currentState?.validate();
    }
    final isObjectTypeCorrect = _objectTypeController.text.isNotEmpty;
    if (!isObjectTypeCorrect) {
      _objectTypeValidationText = 'error';
      _formObjectTypeKey.currentState?.validate();
    }
    final isObjectCountCorrect = _objectCountController.text.isNotEmpty;
    if (!isObjectCountCorrect) {
      _objectCountValidationText = 'error';
      _formObjectCountKey.currentState?.validate();
    }
    final isDescriptionCorrect = _descriptionController.text.isNotEmpty;
    if (!isDescriptionCorrect) {
      _descriptionValidationText = 'error';
      _formDescriptionKey.currentState?.validate();
    }
    final isMeasureUnitCorrect = model.object.measureUnit.isNotEmpty;
    if (!isMeasureUnitCorrect) {
      _measureUnitMessageState.value = 'error';
    }
    if (isObjectNameCorrect && isObjectTypeCorrect && isObjectCountCorrect && isMeasureUnitCorrect ) {
      await model.addObjectAndObjectType();
      await router.pop();
    }

  }

  @override
  Future<void> saveObjectMeasureUnit(String measureUnit) async {
    model.measureUnit = measureUnit;
    _objectsState.content(model.object);
    _objectsState.notifyListeners();
    _measureUnitMessageState.value = null;
  }

  @override
  TextEditingController get objectTypeController => _objectTypeController;

  @override
  TextEditingController get objectNameController => _objectNameController;

  @override
  TextEditingController get objectCountController => _objectCountController;

  @override
  TextEditingController get descriptionController => _descriptionController;

  @override
  GlobalKey<FormState> get formObjectTypeKey => _formObjectTypeKey;

  @override
  GlobalKey<FormState> get formObjectNameKey => _formObjectNameKey;

  @override
  GlobalKey<FormState> get formObjectCountKey => _formObjectCountKey;

  @override
  GlobalKey<FormState> get formDescriptionKey => _formDescriptionKey;

  @override
  String? getObjectNameValidationText() => _objectNameValidationText;

  @override
  String? getObjectTypeValidationText() => _objectTypeValidationText;

  @override
  String? getObjectCountValidationText() => _objectCountValidationText;

  @override
  String? getDescriptionValidationText() => _descriptionValidationText;

  @override
  UnionStateNotifier<ObjectData> get objectsState => _objectsState;
  @override
  ValueNotifier<String?> get measureUnitMessageState => _measureUnitMessageState;

}

abstract class IAddObjectWidgetModel implements IWidgetModel {
  Future<void> addObject();

  void closeScreen() {}

  void savePhoto(Uint8List photo);

  void saveObjectMeasureUnit(String carModel);
  ValueNotifier<String?> get measureUnitMessageState;

  UnionStateNotifier<ObjectData> get objectsState;

  TextEditingController get objectTypeController;

  TextEditingController get objectNameController;

  TextEditingController get objectCountController;

  TextEditingController get descriptionController;

  GlobalKey<FormState> get formObjectTypeKey;

  GlobalKey<FormState> get formObjectNameKey;

  GlobalKey<FormState> get formDescriptionKey;

  GlobalKey<FormState> get formObjectCountKey;

  String? getObjectTypeValidationText();

  String? getObjectNameValidationText();

  String? getDescriptionValidationText();

  String? getObjectCountValidationText();
}
