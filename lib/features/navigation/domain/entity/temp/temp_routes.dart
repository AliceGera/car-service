import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_paths.dart';
import 'package:car_service/features/navigation/domain/entity/dash/dash_routes.dart';
import 'package:car_service/features/navigation/domain/entity/debug/debug_routes.dart';
import 'package:car_service/features/navigation/domain/entity/info/info_routes.dart';
import 'package:car_service/features/navigation/service/router.dart';

final tempRoutes = AutoRoute(
  page: TempRouter.page,
  initial: true,
  path: AppRoutePaths.tempPath,
  children: [
    dashRoutes,
    infoRoutes,
    debugRoutes,
  ],
);
