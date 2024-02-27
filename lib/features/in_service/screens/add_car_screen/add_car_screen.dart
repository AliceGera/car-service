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
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'add_car_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.addCarScreen,
)
class AddCarScreen extends ElementaryWidget<IAddCarScreenWidgetModel> {
  AddCarScreen({
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = addCarScreenWmFactory,
  }) : super(wmFactory, key: key);
  final VoidCallback loadAgain;
  final List<String> carBrand = ['Volkswagen', 'Toyota', 'Lada', 'Kia', 'Hyundai', 'Ford', 'BMW', 'Mercedes'];

  final List<String> releaseYear = ['2024', '2023', '2022', '2021', '2020', '2019', '2018', '2017'];

  final inputFormaters = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^(\+?\d{0,3})?[\s.-]?\(?\d{0,3}\)?[\s.-]?\d{0,4}[\s.-]?\d{0,4}$')),
  ];

  @override
  Widget build(IAddCarScreenWidgetModel wm) {
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
                'Добавление автомобиля',
                style: AppTextStyle.medium17.value,
              ),
              const Spacer(),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ValueListenableBuilder<CarData>(
                builder: (context, car, child) {
                  return Column(
                    children: [
                      Container(
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
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: AppCameraWidget(savePhoto: wm.savePhoto),
                              ),
                              const SizedBox(height: 10),
                              ValueListenableBuilder<String?>(
                                builder: (context, carBrandMessage, child) {
                                  return DropdownWidget(
                                    items: carBrand,
                                    title: car.carBrand.isEmpty ? 'Марка автомобиля' : car!.carBrand,
                                    selectedValueText: wm.saveCarBrand,
                                    colorBorder: carBrandMessage != null ? Colors.red : AppColors.gray,
                                    text: car.carBrand.isEmpty ? '' : 'Марка автомобиля',
                                  );
                                },
                                valueListenable: wm.carBrandMessageState,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppTextFieldWidget(
                                      formKey: wm.formCarModelKey,
                                      text: 'Модель автомобиля',
                                      controller: wm.carModelController,
                                      validatorText: wm.getCarModelValidationText,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ValueListenableBuilder<String?>(
                                      builder: (context, releaseYearMessage, child) {
                                        return DropdownWidget(
                                          items: releaseYear,
                                          title: car.releaseYear.isEmpty ? 'Год выпуска' : car!.releaseYear,
                                          selectedValueText: wm.saveReleaseYear,
                                          colorBorder: releaseYearMessage != null ? Colors.red : AppColors.gray,
                                          text: car.releaseYear.isEmpty ? '' : 'Год выпуска',
                                        );
                                      },
                                      valueListenable: wm.releaseYearMessageState,
                                    ),
                                  ),
                                ],
                              ),
                              AppTextFieldWidget(
                                formKey: wm.formRegistrationNumberKey,
                                text: 'Регистрационный номер',
                                controller: wm.registrationNumberController,
                                validatorText: wm.getRegistrationNumberValidationText,
                              ),
                              Container(width: double.infinity, height: 0.2, color: AppColors.gray),
                              AppTextFieldWidget(
                                formKey: wm.formFirstAndLastNameKey,
                                text: 'Фамилия и имя владельца',
                                controller: wm.firstAndLastNameController,
                                validatorText: wm.getFirstAndLastNameValidationText,
                              ),
                              AppTextFieldWidget(
                                formKey: wm.formPhoneNumberKey,
                                text: 'Контактный номер',
                                controller: wm.phoneNumberController,
                                validatorText: wm.getPhoneNumberValidationText,
                                keyboardType: TextInputType.phone,
                                inputFormatters: inputFormaters,
                              ),
                              Container(width: double.infinity, height: 0.2, color: AppColors.gray),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12, top: 6),
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () async {
                                    final result = await showAppDatePicker(context);
                                    if (result != null && result.isNotEmpty) {
                                      wm.addDate(result.first);
                                    }
                                  },
                                  child: ValueListenableBuilder<String?>(
                                    builder: (context, dateTimeMessage, child) {
                                      return ChooseWidget(
                                        textColor: car.carDate != null ? Colors.black : AppColors.prime,
                                        color: dateTimeMessage != null ? Colors.red : AppColors.gray,
                                        text: car.carDate != null ? DateFormat('dd.MM.yyyy').format(car.carDate!) : 'Дата поступления в сервис',
                                        assetName: SvgIcons.datePicker,
                                        fieldName: car.carDate == null ? '' : 'Дата поступления в сервис',
                                      );
                                    },
                                    valueListenable: wm.dateTimeMessageState,
                                  ),
                                ),
                              ),
                              AppTextFieldWidget(
                                formKey: wm.formWorksListKey,
                                text: 'Список работ',
                                controller: wm.worksListController,
                                validatorText: wm.getWorksListValidationText,
                              ),
                              AppTextFieldWidget(
                                formKey: wm.formCommentKey,
                                text: 'Комментарий',
                                controller: wm.commentController,
                                validatorText: wm.getCommentValidationText,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: AppButtonWidget(
                          title: 'Сохранить',
                          onPressed: (car.carModel.isNotEmpty &&
                                  car.carBrand.isNotEmpty &&
                                  car.releaseYear.isNotEmpty &&
                                  car.registrationNumber.isNotEmpty &&
                                  car.firstAndLastName.isNotEmpty &&
                                  car.phoneNumber.isNotEmpty &&
                                  car.carDate != null &&
                                  car.worksList.isNotEmpty)
                              ? () async {
                                  await wm.addCar.call();
                                  loadAgain.call();
                                }
                              : null,
                          color: (car.carModel.isNotEmpty &&
                                  car.carBrand.isNotEmpty &&
                                  car.releaseYear.isNotEmpty &&
                                  car.registrationNumber.isNotEmpty &&
                                  car.firstAndLastName.isNotEmpty &&
                                  car.phoneNumber.isNotEmpty &&
                                  car.carDate != null &&
                                  car.worksList.isNotEmpty)
                              ? AppColors.prime
                              : AppColors.white,
                          textColor: (car.carModel.isNotEmpty &&
                                  car.carBrand.isNotEmpty &&
                                  car.releaseYear.isNotEmpty &&
                                  car.registrationNumber.isNotEmpty &&
                                  car.firstAndLastName.isNotEmpty &&
                                  car.phoneNumber.isNotEmpty &&
                                  car.carDate != null &&
                                  car.worksList.isNotEmpty)
                              ? Colors.white
                              : AppColors.darkGray,
                          borderColor: (car.carModel.isNotEmpty &&
                                  car.carBrand.isNotEmpty &&
                                  car.releaseYear.isNotEmpty &&
                                  car.registrationNumber.isNotEmpty &&
                                  car.firstAndLastName.isNotEmpty &&
                                  car.phoneNumber.isNotEmpty &&
                                  car.carDate != null &&
                                  car.worksList.isNotEmpty)
                              ? AppColors.prime
                              : Colors.black,
                        ),
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
