import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/info/screen/info_screen_export.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

@RoutePage(
  name: AppRouteNames.infoScreen,
)
class InfoScreen extends ElementaryWidget<IInfoScreenWidgetModel> {
  const InfoScreen({
    Key? key,
    WidgetModelFactory wmFactory = infoScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IInfoScreenWidgetModel wm) {
    return const SizedBox();
  }
}
