import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/debug/screens/log_history_screen/log_history_export.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

@RoutePage(
  name: AppRouteNames.logHistoryScreen,
)
class LogHistoryScreen extends ElementaryWidget<ILogHistoryWm> {
  const LogHistoryScreen({
    Key? key,
    WidgetModelFactory wmFactory = logHistoryScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ILogHistoryWm wm) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}
