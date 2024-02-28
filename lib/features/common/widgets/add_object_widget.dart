import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/widgets/app_button_widget.dart';
import 'package:car_service/features/common/widgets/app_camera_widget.dart';
import 'package:car_service/features/common/widgets/app_dropdown.dart';
import 'package:car_service/features/common/widgets/app_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppAddOrEditObjectWidget extends StatelessWidget {
  final VoidCallback? closeScreen;
  final TextEditingController objectTypeController;
  final TextEditingController objectNameController;
  final TextEditingController? objectCountController;
  final TextEditingController? descriptionController;
  final ObjectData object;
  final ObjectTypeData? objectType;
  final VoidCallback loadAgain;
  final bool isEdit;
  void Function(Uint8List photo) savePhoto;
  final Future<void> Function() addOrEditGift;
  final void Function(int)? rateOnTap;
  final void Function(String) saveObjectMeasureUnit;
  final ValueNotifier<String?> measureUnitMessageState;
  final GlobalKey<FormState>? formObjectTypeKey;
  final GlobalKey<FormState>? formObjectNameKey;
  final GlobalKey<FormState>? formDescriptionKey;
  final GlobalKey<FormState>? formObjectCountKey;
  final String? Function()? descriptionValidatorText;
  final String? Function()? objectTypeValidatorText;
  final String? Function()? objectNameValidatorText;
  final String? Function()? objectCountValidatorText;

  AppAddOrEditObjectWidget({
    this.descriptionValidatorText,
    this.objectTypeValidatorText,
    this.objectNameValidatorText,
    this.objectCountValidatorText,
    this.isEdit = false,
    required this.measureUnitMessageState,
    required this.saveObjectMeasureUnit,
    required this.descriptionController,
    required this.objectCountController,
    required this.objectNameController,
    required this.objectTypeController,
    required this.addOrEditGift,
    this.formObjectTypeKey,
    this.formObjectNameKey,
    this.formDescriptionKey,
    this.formObjectCountKey,
    required this.object,
    required this.loadAgain,
    required this.savePhoto,
    super.key,
    this.rateOnTap,
    this.closeScreen,
    this.objectType,
  });

  final List<String> measureUnit = [
    'Шт',
    'Л',
    'Мл',
    'Пар',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 12),
          DecoratedBox(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isEdit
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: AppCameraWidget(savePhoto: savePhoto, photo: object?.photo),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: AppCameraWidget(savePhoto: savePhoto),
                            ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextFieldWidget(
                              text: 'Вид',
                              controller: objectTypeController,
                              formKey: formObjectTypeKey,
                              validatorText: objectTypeValidatorText,
                            ),
                            AppTextFieldWidget(
                              text: 'Название',
                              controller: objectNameController,
                              formKey: formObjectNameKey,
                              validatorText: objectNameValidatorText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(width: double.infinity, height: 0.2, color: AppColors.gray),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFieldWidget(
                          text: 'Количество',
                          controller: objectCountController,
                          isPrice: true,
                          validatorText: objectCountValidatorText,
                          formKey: formObjectCountKey,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ValueListenableBuilder<String?>(
                          builder: (context, measureUnitMessage, child) {
                            return DropdownWidget(
                              items: measureUnit,
                              title: object.measureUnit.isEmpty ? 'Ед. измерения' : object.measureUnit,
                              text: object.measureUnit.isEmpty ? '' : 'Ед. измерения',
                              selectedValueText: saveObjectMeasureUnit,
                              colorBorder: measureUnitMessage != null ? Colors.red : AppColors.gray,
                              isEdit: isEdit,

                            );
                          },
                          valueListenable: measureUnitMessageState,
                        ),
                      ),
                    ],
                  ),
                  Container(width: double.infinity, height: 0.2, color: AppColors.gray),
                  AppTextFieldWidget(
                    text: 'Описание',
                    controller: descriptionController,
                    formKey: formDescriptionKey,
                    validatorText: descriptionValidatorText,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          AppButtonWidget(
            title: 'Сохранить',
            onPressed: (objectType?.objectTypeName.isNotEmpty == true &&
                    object.objectName.isNotEmpty &&
                    object.objectCount.isNotEmpty &&
                    object.measureUnit.isNotEmpty)
                ? () async {
                    await addOrEditGift();
                    loadAgain.call();
                  }
                : null,
            color: (objectType?.objectTypeName.isNotEmpty == true &&
                    object.objectName.isNotEmpty &&
                    object.objectCount.isNotEmpty &&
                    object.measureUnit.isNotEmpty)
                ? AppColors.prime
                : AppColors.white,
            textColor: (objectType?.objectTypeName.isNotEmpty == true &&
                    object.objectName.isNotEmpty &&
                    object.objectCount.isNotEmpty &&
                    object.measureUnit.isNotEmpty)
                ? Colors.white
                : AppColors.darkGray,
            borderColor: (objectType?.objectTypeName.isNotEmpty == true &&
                    object.objectName.isNotEmpty &&
                    object.objectCount.isNotEmpty &&
                    object.measureUnit.isNotEmpty)
                ? AppColors.prime
                : Colors.black,
          ),
        ],
      ),
    );
  }
}

class ChooseWidget extends StatelessWidget {
  const ChooseWidget({
    required this.text,
    required this.color,
    super.key,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.prime,
        border: Border.all(color: color, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppTextStyle.regular13.value.copyWith(color: AppColors.white)),
            SvgPicture.asset(SvgIcons.datePicker),
          ],
        ),
      ),
    );
  }
}
