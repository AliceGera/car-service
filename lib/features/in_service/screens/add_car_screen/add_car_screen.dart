import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/widgets/app_button_widget.dart';
import 'package:car_service/features/common/widgets/app_camera_widget.dart';
import 'package:car_service/features/common/widgets/app_date_picker_widget.dart';
import 'package:car_service/features/common/widgets/app_dropdown.dart';
import 'package:car_service/features/common/widgets/app_textfield_widget.dart';
import 'package:car_service/features/common/widgets/choose_widget.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final List<String> carBrand = [
    'Volkswagen',
    'Toyota',
    'Lada',
    'Kia',
    'Hyundai',
    'Ford',
    'BMW',
    'Mercedes',
  ];
  final List<String> carModel = [
    'Rio',
    'Rio',
    'Rio',
    'Rio',
    'Rio',
    'Rio',
    'Rio',
    'Rio',
  ];
  final List<String> releaseYear = [
    '2024',
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
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
                        /*Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black,
                              ),
                              height: 137,
                              width: 137,
                              child: Center(
                                child: Text(
                                  'Место для фото',
                                  style: AppTextStyle.medium16.value.copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                            SvgPicture.asset(SvgIcons.download),
                          ],
                        ),*/
                        const SizedBox(height: 10),
                        MyHomePage(items: carBrand, title: 'Марка автомобиля'),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: MyHomePage(items: carModel, title: 'Модель автомобиля')),
                            const SizedBox(width: 10),
                            Expanded(child: MyHomePage(items: releaseYear, title: 'Год выпуска')),
                          ],
                        ),
                        AppTextFieldWidget(
                          formKey: wm.formRegistrationNumberKey,
                          text: 'Регистрационный номер',
                          controller: wm.registrationNumberController,
                          validatorText: wm.getRegistrationNumberValidationText,
                        ),
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
                        ),
                        ValueListenableBuilder<DateTime?>(
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
                              child: ValueListenableBuilder<String?>(
                                builder: (context, dateTimeMessage, child) {
                                  return ChooseWidget(
                                    color: dateTimeMessage != null ? Colors.red : AppColors.gray,
                                    text: dateTime != null ? DateFormat('dd.MM.yyyy').format(dateTime) : 'Дата поступления в сервис',
                                    assetName: SvgIcons.datePicker,
                                  );
                                },
                                valueListenable: wm.dateTimeMessageState,
                              ),
                            );
                          },
                          valueListenable: wm.dateTimeState,
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
                // Spacer(),
                AppButtonWidget(
                  title: 'Сохранить',
                 onPressed: wm.addCar,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
