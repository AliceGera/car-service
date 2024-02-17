
import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/services/screens/services_screen/services_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

@RoutePage(
  name: AppRouteNames.servicesScreen,
)
class ServicesScreen extends ElementaryWidget<IServicesScreenWidgetModel> {
  const ServicesScreen({
    Key? key,
    WidgetModelFactory wmFactory =  servicesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServicesScreenWidgetModel wm) {
    return const Column(

    );
  }
}

