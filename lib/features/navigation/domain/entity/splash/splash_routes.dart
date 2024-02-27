import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_paths.dart';
import 'package:car_service/features/navigation/service/router.dart';

final splashRoutes = AutoRoute(
  page: SplashRouter.page,
  path: AppRoutePaths.splashPath,
  initial: true,
);
