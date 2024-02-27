import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/widgets/app_button_widget.dart';
import 'package:car_service/features/common/widgets/app_camera_widget.dart';
import 'package:car_service/features/common/widgets/app_date_picker_widget.dart';
import 'package:car_service/features/common/widgets/app_dropdown.dart';
import 'package:car_service/features/common/widgets/app_textfield_widget.dart';
import 'package:car_service/features/common/widgets/choose_widget.dart';
import 'package:car_service/features/in_service/screens/edit_car_screen/edit_car_screen_widget_model.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

@RoutePage(
  name: AppRouteNames.editCarScreen,
)
class EditCarScreen extends ElementaryWidget<IEditCarScreenWidgetModel> {
  EditCarScreen({
    this.loadAgain,
    this.refreshCar,
    required this.car,
    Key? key,
    WidgetModelFactory wmFactory = editCarScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final VoidCallback? loadAgain;
  final void Function(CarData car)? refreshCar;
  final CarData car;
  final List<String> carBrand = ['Volkswagen', 'Toyota', 'Lada', 'Kia', 'Hyundai', 'Ford', 'BMW', 'Mercedes'];
  final List<String> releaseYear = ['2024', '2023', '2022', '2021', '2020', '2019', '2018', '2017'];
  final inputFormaters = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^(\+?\d{0,3})?[\s.-]?\(?\d{0,3}\)?[\s.-]?\d{0,4}[\s.-]?\d{0,4}$')),
  ];

  @override
  Widget build(IEditCarScreenWidgetModel wm) {
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
                'Редактирование автомобиля',
                style: AppTextStyle.medium17.value,
              ),
              const Spacer(),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ValueListenableBuilder<CarData?>(
                builder: (context, editedCar, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.backgroundGray,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: AppCameraWidget(savePhoto: wm.savePhoto, photo: editedCar?.photo),
                                ),
                                DropdownWidget(
                                  items: carBrand,
                                  isEdit: true,
                                  title: editedCar!.carBrand.isEmpty ? 'Марка автомобиля' : editedCar!.carBrand,
                                  selectedValueText: wm.saveCarBrand,
                                  text: car.carBrand.isEmpty ? '' : 'Марка автомобиля',
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppTextFieldWidget(
                                        text: 'Модель автомобиля',
                                        controller: wm.carModelController,
                                        formKey: wm.formCarModelKey,
                                        validatorText: wm.getCarModelValidationText,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: DropdownWidget(
                                        isEdit: true,
                                        items: releaseYear,
                                        title: editedCar.releaseYear.isEmpty ? 'Год выпуска' : editedCar!.releaseYear,
                                        selectedValueText: wm.saveReleaseYear,
                                        text: car.releaseYear.isEmpty ? '' : 'Год выпуска',
                                      ),
                                    ),
                                  ],
                                ),
                                AppTextFieldWidget(
                                  text: 'Регистрационный номер',
                                  controller: wm.registrationNumberController,
                                  formKey: wm.formRegistrationNumberKey,
                                  validatorText: wm.getRegistrationNumberValidationText,
                                ),
                                Container(width: double.infinity, height: 0.2, color: AppColors.gray),
                                AppTextFieldWidget(
                                  text: 'Фамилия и имя владельца',
                                  controller: wm.firstAndLastNameController,
                                  formKey: wm.formFirstAndLastNameKey,
                                  validatorText: wm.getFirstAndLastNameValidationText,
                                ),
                                AppTextFieldWidget(
                                  text: 'Контактный номер',
                                  controller: wm.phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: inputFormaters,
                                  formKey: wm.formPhoneNumberKey,
                                  validatorText: wm.getPhoneNumberValidationText,
                                ),
                                Container(width: double.infinity, height: 0.2, color: AppColors.gray),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6, bottom: 12),
                                  child: ValueListenableBuilder<DateTime?>(
                                    builder: (context, dateTime, child) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () async {
                                          final result = await showAppDatePicker(context);
                                          if (result != null && result.isNotEmpty) {
                                            wm.addDate(result.first);
                                          }
                                        },
                                        child: ChooseWidget(
                                          text: dateTime != null ? DateFormat('dd.MM.yyyy').format(dateTime) : 'Дата поступления в сервис',
                                          assetName: SvgIcons.datePicker,
                                          color: AppColors.gray,
                                          isEdit: true,
                                          textColor: dateTime != null ? Colors.black : AppColors.prime,
                                          fieldName: car.carDate == null ? '' : 'Дата поступления в сервис',
                                        ),
                                      );
                                    },
                                    valueListenable: wm.dateTimeState,
                                  ),
                                ),
                                AppTextFieldWidget(
                                  text: 'Список работ',
                                  controller: wm.worksListController,
                                  formKey: wm.formWorksListKey,
                                  validatorText: wm.getWorksListValidationText,
                                ),
                                AppTextFieldWidget(
                                  text: 'Комментарий',
                                  controller: wm.commentController,
                                  formKey: wm.formCommentKey,
                                  validatorText: wm.getCommentValidationText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AppButtonWidget(
                        title: 'Сохранить',
                        onPressed: (editedCar.carModel.isNotEmpty &&
                                editedCar.carBrand.isNotEmpty &&
                                editedCar.releaseYear.isNotEmpty &&
                                editedCar.registrationNumber.isNotEmpty &&
                                editedCar.firstAndLastName.isNotEmpty &&
                                editedCar.phoneNumber.isNotEmpty &&
                                editedCar.carDate != null &&
                                editedCar.worksList.isNotEmpty)
                            ? () async {
                                await wm.editCar();
                                loadAgain?.call();
                              }
                            : null,
                        color: (editedCar.carModel.isNotEmpty &&
                                editedCar.carBrand.isNotEmpty &&
                                editedCar.releaseYear.isNotEmpty &&
                                editedCar.registrationNumber.isNotEmpty &&
                                editedCar.firstAndLastName.isNotEmpty &&
                                editedCar.phoneNumber.isNotEmpty &&
                                editedCar.carDate != null &&
                                editedCar.worksList.isNotEmpty)
                            ? AppColors.prime
                            : AppColors.white,
                        textColor: (car.carModel.isNotEmpty &&
                                editedCar.carBrand.isNotEmpty &&
                                editedCar.releaseYear.isNotEmpty &&
                                editedCar.registrationNumber.isNotEmpty &&
                                editedCar.firstAndLastName.isNotEmpty &&
                                editedCar.phoneNumber.isNotEmpty &&
                                editedCar.carDate != null &&
                                editedCar.worksList.isNotEmpty)
                            ? Colors.white
                            : AppColors.darkGray,
                        borderColor: (editedCar.carModel.isNotEmpty &&
                                editedCar.carBrand.isNotEmpty &&
                                editedCar.releaseYear.isNotEmpty &&
                                editedCar.registrationNumber.isNotEmpty &&
                                editedCar.firstAndLastName.isNotEmpty &&
                                editedCar.phoneNumber.isNotEmpty &&
                                editedCar.carDate != null &&
                                editedCar.worksList.isNotEmpty)
                            ? AppColors.prime
                            : Colors.black,
                      ),
                    ],
                  );
                },
                valueListenable: wm.carState,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
