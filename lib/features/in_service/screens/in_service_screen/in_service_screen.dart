import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/widgets/app_button_widget.dart';
import 'package:car_service/features/common/widgets/app_iteams_list_widget.dart';
import 'package:car_service/features/common/widgets/app_main_title.dart';
import 'package:car_service/features/common/widgets/choose_edit_or_delete_dialog_widget.dart';
import 'package:car_service/features/common/widgets/delete_dialog_widget.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:union_state/union_state.dart';
import 'in_service_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.inServiceScreen,
)
class InServiceScreen extends ElementaryWidget<IInServiceScreenWidgetModel> {
  const InServiceScreen({
    Key? key,
    WidgetModelFactory wmFactory = inServiceScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IInServiceScreenWidgetModel wm) {
    return Builder(builder: (context) {
      return UnionStateListenableBuilder<List<CarData>>(
        unionStateListenable: wm.carsState,
        builder: (_, cars) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const AppMainWidget(title: 'Сейчас в сервисе'),
                cars.isEmpty
                    ? Expanded(
                        child: Column(
                          children: [
                            SvgPicture.asset(SvgIcons.carService),
                            Text(
                              'Сейчас в сервисе нет автомобилей',
                              style: AppTextStyle.light12.value,
                            ),
                          ],
                        ),
                      )
                    : AppItemListWidget<CarData>(
                        carBrand: cars.map((e) => e.carBrand).toList(),
                        carModel: cars.map((e) => e.carModel).toList(),
                        registrationNumber:
                            cars.map((e) => e.registrationNumber).toList() /*!= null ? DateFormat('dd.MM.yyyy').format(e.carDate!) : '').toList()*/,
                        photoList: cars.map((e) => e.photo).toList(),
                        values: cars,
                        onItemTap: wm.openCarInfoScreen,
                        onTapThreeDots: (car) {
                          showDialog<void>(
                            context: context,
                            builder: (ctx) => ChooseEditOrDeleteDialogWidget(
                              icon: SvgIcons.download,
                              editCarScreen: () {
                                Navigator.pop(ctx);
                                wm.openEditCarScreen.call(car);
                              },
                              deleteCar: () {
                                Navigator.pop(ctx);
                                showDialog<void>(
                                  context: context,
                                  builder: (ctx) => DeleteDialogWidget(
                                    deleteCar: () async {
                                      Navigator.pop(ctx);
                                      await wm.deleteCarInfoScreen.call(car);
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: AppButtonWidget(
                    title: 'Добавить автомобиль',
                    onPressed: wm.openAddCarScreen,
                  ),
                ),
              ],
            ),
          );
        },
        loadingBuilder: (_, cars) => const SizedBox(),
        failureBuilder: (_, exception, cars) => const SizedBox(),
      );
    });
  }
}
