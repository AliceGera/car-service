import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/debug/screens/debug_screen/debug_screen_export.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

@RoutePage(
  name: AppRouteNames.debugScreen,
)
class DebugScreen extends ElementaryWidget<IDebugScreenWidgetModel> {
  const DebugScreen({
    Key? key,
    WidgetModelFactory wmFactory = debugScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDebugScreenWidgetModel wm) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}
