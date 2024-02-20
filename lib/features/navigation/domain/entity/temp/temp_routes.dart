import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/navigation/domain/entity/add_car/add_car.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_paths.dart';
import 'package:car_service/features/navigation/domain/entity/in_service/in_service_routes.dart';
import 'package:car_service/features/navigation/domain/entity/service_record/service_record_routes.dart';
import 'package:car_service/features/navigation/domain/entity/service_warehouse/service_warehouse_routes.dart';
import 'package:car_service/features/navigation/domain/entity/services/services_routes.dart';
import 'package:car_service/features/navigation/domain/entity/settings/settings_routes.dart';
import 'package:car_service/features/navigation/service/router.dart';

final tempRoutes = AutoRoute(
  page: TempRouter.page,
  initial: true,
  path: AppRoutePaths.tempPath,
  children: [
    inServiceRoutes,
    serviceRecordRoutes,
    serviceWarehouseRoutes,
    servicesRoutes,
    settingsRoutes,
  ],
);
