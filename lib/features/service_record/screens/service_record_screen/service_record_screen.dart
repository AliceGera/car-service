import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/common/widgets/app_main_title.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/service_record/screens/service_record_screen/service_record_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

@RoutePage(
  name: AppRouteNames.serviceRecordScreen,
)
class ServiceRecordScreen extends ElementaryWidget<IServiceRecordScreenWidgetModel> {
  const ServiceRecordScreen({
    Key? key,
    WidgetModelFactory wmFactory = serviceRecordScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServiceRecordScreenWidgetModel wm) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const AppMainWidget(title: 'Запись в сервис'),


        ],
      ),
    );
  }
}
