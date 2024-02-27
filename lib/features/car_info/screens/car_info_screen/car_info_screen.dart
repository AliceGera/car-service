import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/car_info/screens/car_info_screen/car_info_screen_widget_model.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

@RoutePage(
  name: AppRouteNames.carInfoScreen,
)
class CarInfoScreen extends ElementaryWidget<ICarInfoScreenWidgetModel> {
  const CarInfoScreen({
    required this.car,
    this.refreshCar,
    required this.loadAgain,
    Key? key,
    WidgetModelFactory wmFactory = carInfoScreenWmFactory,
  }) : super(wmFactory, key: key);
  final CarData car;
  final VoidCallback loadAgain;
  final void Function(CarData car)? refreshCar;

  @override
  Widget build(ICarInfoScreenWidgetModel wm) {
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
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: ValueListenableBuilder<CarData>(
            builder: (context, editCar, child) {
              return Padding(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 68,
                                    width: 68,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(34),
                                      child: editCar?.photo.isNotEmpty == true
                                          ? Image.memory(
                                              editCar!.photo,
                                              fit: BoxFit.cover,
                                            )
                                          : Container(
                                              color: AppColors.prime,
                                            ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${editCar?.carBrand} ${editCar?.carModel},',
                                                    style: AppTextStyle.medium22.value.copyWith(color: Colors.black),
                                                  ),
                                                  Text(
                                                    editCar.releaseYear,
                                                    style: AppTextStyle.medium16.value.copyWith(color: AppColors.darkGray),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    wm.openEditCarScreen.call(editCar);
                                                  },
                                                  highlightColor: Colors.transparent,
                                                  splashColor: Colors.transparent,
                                                  child: SvgPicture.asset(SvgIcons.pen)),
                                            ],
                                          ),
                                          Text(
                                            editCar.registrationNumber,
                                            style: AppTextStyle.medium20.value.copyWith(color: AppColors.darkGray),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: AppColors.gray, height: 0.2),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                editCar.firstAndLastName,
                                style: AppTextStyle.medium18.value,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  SvgPicture.asset(SvgIcons.phone),
                                  const SizedBox(width: 10),
                                  Text(
                                    editCar.phoneNumber,
                                    style: AppTextStyle.regular14.value,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: AppColors.gray, height: 0.2),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  SvgPicture.asset(SvgIcons.datePicker),
                                  const SizedBox(width: 10),
                                  Text(
                                    editCar.carDate != null ? DateFormat('dd.MM.yyyy').format(editCar.carDate!) : 'Дата поступления в сервис',
                                    style: AppTextStyle.regular14.value,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Список работ',
                                style: AppTextStyle.medium18.value.copyWith(color: AppColors.prime),
                              ),
                            ),
                            Text(
                              editCar.worksList,
                              style: AppTextStyle.regular14.value.copyWith(color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Комментарий',
                                style: AppTextStyle.medium18.value.copyWith(color: AppColors.prime),
                              ),
                            ),
                            Text(
                              editCar.comment,
                              style: AppTextStyle.regular14.value.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            valueListenable: wm.carState,
          ),
        ),
      ),
    );
  }
}
