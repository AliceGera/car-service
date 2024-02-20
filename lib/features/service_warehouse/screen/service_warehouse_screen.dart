import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/widgets/app_main_title.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/service_warehouse/screen/service_warehouse_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage(
  name: AppRouteNames.serviceWarehouseScreen,
)
class ServiceWarehouseScreen extends ElementaryWidget<IServiceWarehouseScreenWidgetModel> {
  const ServiceWarehouseScreen({
    Key? key,
    WidgetModelFactory wmFactory = serviceWarehouseScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServiceWarehouseScreenWidgetModel wm) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
         children: [
          const AppMainWidget(title: 'Cклад сервиса'),


        ],
      ),
    );
  }
}
