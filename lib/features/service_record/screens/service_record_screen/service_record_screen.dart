import 'package:auto_route/auto_route.dart';
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
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'service Record',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 46),
      ],
    );
  }
}
