import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/navigation/domain/entity/temp/temp_routes.dart';
import 'package:car_service/features/service_warehouse/screen/service_warehouse_screen_export.dart';
import 'package:car_service/features/service_record/screens/service_record_screen/service_record_screen_export.dart';
import 'package:car_service/features/temp/screens/temp_screen/temp_screen_export.dart';
import 'package:car_service/features/services/screens/services_screen/services_export.dart';
import 'package:car_service/features/settings/screens/settings_screen/settings_screen_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:car_service/features/in_service/screen/in_service_screen.dart';
import 'package:car_service/features/in_service/screen/in_service_screen_widget_model.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'ScreenWidget|Screen,Route',
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        tempRoutes,
        //logHistoryRoutes,
        // uiKitRoutes,
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
