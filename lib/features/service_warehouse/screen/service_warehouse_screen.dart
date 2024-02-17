import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/service_warehouse/screen/service_warehouse_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'service warehouse',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black,),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 46),

      ],
    );
  }
}
