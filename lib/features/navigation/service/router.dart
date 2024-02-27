import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/common/domain/data/cars/car_data.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/in_service/screens/edit_car_screen/edit_car_screen.dart';
import 'package:car_service/features/in_service/screens/edit_car_screen/edit_car_screen_widget_model.dart';
import 'package:car_service/features/navigation/domain/entity/add_car/add_car.dart';
import 'package:car_service/features/navigation/domain/entity/add_object/add_object.dart';
import 'package:car_service/features/navigation/domain/entity/add_record/add_record.dart';
import 'package:car_service/features/navigation/domain/entity/car_info/car_info.dart';
import 'package:car_service/features/navigation/domain/entity/edit_car/edit_car.dart';
import 'package:car_service/features/navigation/domain/entity/edit_object/edit_object.dart';
import 'package:car_service/features/navigation/domain/entity/edit_record/edit_record.dart';
import 'package:car_service/features/navigation/domain/entity/onboarding/onboarding_routes.dart';
import 'package:car_service/features/navigation/domain/entity/splash/splash_routes.dart';
import 'package:car_service/features/navigation/domain/entity/temp/temp_routes.dart';
import 'package:car_service/features/onboarding_screen/onboarding_screen.dart';
import 'package:car_service/features/onboarding_screen/onboarding_screen_widget_model.dart';
import 'package:car_service/features/service_warehouse/screens/service_warehouse_screen/service_warehouse_screen_export.dart';
import 'package:car_service/features/service_warehouse/screens/add_object_screen/add_object_screen_export.dart';
import 'package:car_service/features/service_warehouse/screens/edit_object_screen/edit_object_screen_export.dart';
import 'package:car_service/features/service_record/screens/service_record_screen/service_record_screen_export.dart';
import 'package:car_service/features/service_record/screens/add_record_screen/add_record_screen_export.dart';
import 'package:car_service/features/service_record/screens/edit_record_screen/edit_record_screen_export.dart';
import 'package:car_service/features/splash/screen/splash_screen.dart';
import 'package:car_service/features/splash/screen/splash_screen_widget_model.dart';
import 'package:car_service/features/temp/screens/temp_screen/temp_screen_export.dart';
import 'package:car_service/features/services/screens/services_screen/services_export.dart';
import 'package:car_service/features/settings/screens/settings_screen/settings_screen_export.dart';
import 'package:car_service/features/in_service/screens/add_car_screen/add_car_screen_export.dart';
import 'package:car_service/features/car_info/screens/car_info_screen/car_info_screen_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:car_service/features/in_service/screens/in_service_screen/in_service_screen.dart';
import 'package:car_service/features/in_service/screens/in_service_screen/in_service_screen_widget_model.dart';

import '../../common/domain/data/objectTypes/object_type_data.dart';

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
        addCarRoutes,
        carInfoRoutes,
        editCarRoutes,
        addObjectRoutes,
        editObjectRoutes,
        addRecordRoutes,
        editRecordRoutes,
        onboardingRoutes,
        splashRoutes,
      ];

  AppRouter._();

  factory AppRouter.instance() => _router;
}
