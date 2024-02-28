import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';
import 'package:car_service/features/common/widgets/add_object_widget.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/service_warehouse/screens/edit_object_screen/edit_object_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:union_state/union_state.dart';

@RoutePage(
  name: AppRouteNames.editObjectScreen,
)
class EditObjectScreen extends ElementaryWidget<IEditObjectScreenWidgetModel> {
  const EditObjectScreen({
    required this.loadAgain,
    required this.objectType,
    required this.object,
    Key? key,
    WidgetModelFactory wmFactory = editObjectScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);
  final VoidCallback loadAgain;
  final ObjectData object;
  final ObjectTypeData objectType;

  @override
  Widget build(IEditObjectScreenWidgetModel wm) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.backgroundBlue,
            AppColors.backgroundLight,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: wm.closeScreen,
                child: SvgPicture.asset(SvgIcons.backArrow),
              ),
              const Spacer(),
              Text(
                'Редактирование предмета',
                style: AppTextStyle.medium17.value,
              ),
              const Spacer(),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: UnionStateListenableBuilder<ObjectTypeWithObjectsData>(
            unionStateListenable: wm.objectTypeWithObjectsState,
            builder: (_, object) {
              return AppAddOrEditObjectWidget(
                isEdit: true,
                saveObjectMeasureUnit: wm.saveObjectMeasureUnit,
                addOrEditGift: wm.editObject,
                object: object.objects.first,
                loadAgain: loadAgain,
                savePhoto: wm.savePhoto,
                objectType: object.objectType,
                objectTypeValidatorText: wm.getObjectTypeValidationText,
                objectNameValidatorText: wm.getObjectNameValidationText,
                objectCountValidatorText: wm.getObjectCountValidationText,
                descriptionController: wm.descriptionController,
                objectCountController: wm.objectCountController,
                objectNameController: wm.objectNameController,
                objectTypeController: wm.objectTypeController,
                formObjectTypeKey: wm.formObjectTypeKey,
                formObjectNameKey: wm.formObjectNameKey,
                formDescriptionKey: wm.formDescriptionKey,
                formObjectCountKey: wm.formObjectCountKey,
                measureUnitMessageState: wm.measureUnitMessageState,
              );
            },
            loadingBuilder: (_, object) => const SizedBox(),
            failureBuilder: (_, exception, object) => const SizedBox(),
          ),
        ),
      ),
    );
  }
}
