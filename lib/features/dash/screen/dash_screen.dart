import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/dash/screen/dash_screen_export.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

@RoutePage(
  name: AppRouteNames.dashScreen,
)
class DashScreen extends ElementaryWidget<IDashScreenWidgetModel> {
  const DashScreen({
    Key? key,
    WidgetModelFactory wmFactory = dashScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDashScreenWidgetModel wm) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 46),

      ],
    );
  }
}
