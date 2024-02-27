import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/widgets/add_object_widget.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:union_state/union_state.dart';
import 'add_object_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.addObjectScreen,
)
class AddObjectScreen extends ElementaryWidget<IAddObjectWidgetModel> {
  const AddObjectScreen({
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = addObjectWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final VoidCallback loadAgain;

  @override
  Widget build(IAddObjectWidgetModel wm) {
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
                'Добавление предмета',
                style: AppTextStyle.medium17.value,
              ),
              const Spacer(),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: UnionStateListenableBuilder<ObjectData>(
            unionStateListenable: wm.objectsState,
            builder: (_, object) {
              return AppAddOrEditObjectWidget(
                saveObjectMeasureUnit: wm.saveObjectMeasureUnit,
                addOrEditGift: wm.addObject,
                object: object,
                loadAgain: loadAgain,
                savePhoto: wm.savePhoto,
                objectTypeValidatorText:wm.getObjectTypeValidationText,
                objectNameValidatorText:wm.getObjectNameValidationText,
                objectCountValidatorText:wm.getObjectCountValidationText,
                measureUnitMessageState:wm.measureUnitMessageState,
                descriptionController: wm.descriptionController,
                objectCountController: wm.objectCountController,
                objectNameController: wm.objectNameController,
                objectTypeController: wm.objectTypeController,
                formObjectTypeKey: wm.formObjectTypeKey,
                formObjectNameKey: wm.formObjectNameKey,
                formObjectCountKey: wm.formObjectCountKey,
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
