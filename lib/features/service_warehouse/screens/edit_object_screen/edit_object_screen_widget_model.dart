import 'dart:typed_data';
import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/service_warehouse/screens/edit_object_screen/edit_object_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';
import 'edit_object_screen.dart';

EditObjectScreenWidgetModel editObjectScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final appScope = context.read<IAppScope>();
  final model = EditObjectScreenModel(
    appScope.objectsService,
    appScope.objectTypesService,
  );
  final router = appDependencies.router;
  return EditObjectScreenWidgetModel(model, router);
}

class EditObjectScreenWidgetModel extends WidgetModel<EditObjectScreen, EditObjectScreenModel> implements IEditObjectScreenWidgetModel {
  final AppRouter router;

  EditObjectScreenWidgetModel(
    super._model,
    this.router,
  );

  final _objectTypeWithObjectsState = UnionStateNotifier<ObjectTypeWithObjectsData>(ObjectTypeWithObjectsData.init().copyWith(objects: [ObjectData.init()]));
  final _measureUnitMessageState = ValueNotifier<String?>(null);

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

  @override
  void initWidgetModel() {
    final args = router.current.args is EditObjectRouterArgs ? router.current.args! as EditObjectRouterArgs : null;

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
    if (args != null) {
      _objectTypeController.text = args.objectType.objectTypeName;
      _objectNameController.text = args.object.objectName;
      _objectCountController.text = args.object.objectCount;
      _descriptionController.text = args.object.description;
      model
        ..photo = args.object.photo
        ..objectTypeName = args.objectType.objectTypeName
        ..description = args.object.description
        ..objectCount = args.object.objectCount
        ..measureUnit = args.object.measureUnit
        ..objectId = args.object.id
        ..objectTypeId = args.objectType.objectTypeId;

      _objectTypeWithObjectsState.content(model.objectTypeWithObjects);
    }
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
  UnionStateNotifier<ObjectTypeWithObjectsData> get objectTypeWithObjectsState => _objectTypeWithObjectsState;

  @override
  String? getObjectNameValidationText() => _objectNameValidationText;

  @override
  String? getObjectTypeValidationText() => _objectTypeValidationText;

  @override
  String? getObjectCountValidationText() => _objectCountValidationText;

  @override
  String? getDescriptionValidationText() => _descriptionValidationText;

  @override
  Future<void> saveObjectMeasureUnit(String measureUnit) async {
    model.measureUnit = measureUnit;
    _objectTypeWithObjectsState.content(model.objectTypeWithObjects);
    _measureUnitMessageState.value = null;
  }

  @override
  Future<void> editObject() async {
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
    final isMeasureUnitCorrect = model.objectTypeWithObjects.objects.first.measureUnit.isNotEmpty;
    if (!isMeasureUnitCorrect) {
      _measureUnitMessageState.value = 'error';
    }
    if (isObjectNameCorrect && isObjectTypeCorrect && isMeasureUnitCorrect) {
      await model.editObject();
      await router.pop();
    }
  }

  @override
  ValueNotifier<String?> get measureUnitMessageState => _measureUnitMessageState;
}

abstract class IEditObjectScreenWidgetModel implements IWidgetModel {
  Future<void> editObject();

  void closeScreen();

  void savePhoto(Uint8List photo);

  void saveObjectMeasureUnit(String carModel);

  UnionStateNotifier<ObjectTypeWithObjectsData> get objectTypeWithObjectsState;

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

  ValueNotifier<String?> get measureUnitMessageState;
}
