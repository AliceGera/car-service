import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_paths.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/temp/screens/temp_screen/temp_screen_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = TempScreenModel();
  return TempScreenWidgetModel(model);
}

class TempScreenWidgetModel extends WidgetModel<TempScreen, ITempScreenModel> implements IDebugWidgetModel {
  final _defaultNavBarItems = [
    const BottomNavigationBarItem(
      label: 'Dash screen',
      icon: Icon(Icons.flutter_dash),
    ),
    const BottomNavigationBarItem(
      label: 'Info screen',
      icon: Icon(Icons.info_outline),
    ),
  ];

  final _debugNavBarItem = const BottomNavigationBarItem(
    label: 'Debug screen',
    icon: Icon(Icons.bug_report_outlined),
  );

  @override
  List<PageRouteInfo> get routes => _routes;

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _navigationBarItems;

  List<PageRouteInfo> get _routes {
    final defaultRoutes = <PageRouteInfo>[DashRouter(), InfoRouter()];
    defaultRoutes.add(DebugRouter());
    return defaultRoutes;
  }

  List<BottomNavigationBarItem> get _navigationBarItems {
    final navBarItems = [..._defaultNavBarItems];
    navBarItems.add(_debugNavBarItem);
    return navBarItems;
  }

  TempScreenWidgetModel(super._model);

  @override
  String appBarTitle(RouteData topRoute) => _appBarTitle(topRoute);

  String _appBarTitle(RouteData topRoute) {
    switch (topRoute.path) {
      case AppRoutePaths.debugPath:
        return 'Экран отладки';
      case AppRoutePaths.dashPath:
        return 'Dash';
      case AppRoutePaths.infoPath:
        return 'Info';
      default:
        return '';
    }
  }
}

abstract class IDebugWidgetModel implements IWidgetModel {
  List<PageRouteInfo<dynamic>> get routes;

  List<BottomNavigationBarItem> get navigationBarItems;

  String appBarTitle(RouteData topRoute);
}
