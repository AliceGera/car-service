import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'in_service_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.inServiceScreen,
)
class InServiceScreen extends ElementaryWidget<IInfoScreenWidgetModel> {
  const InServiceScreen({
    Key? key,
    WidgetModelFactory wmFactory = inServiceScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IInfoScreenWidgetModel wm) {
    return const SizedBox(
      child: Text('InService',style: TextStyle(color: Colors.black),),
    );
  }
}
