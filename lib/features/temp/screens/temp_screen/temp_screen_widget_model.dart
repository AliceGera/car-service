import 'package:auto_route/auto_route.dart';
import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_paths.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/temp/screens/temp_screen/temp_screen_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_service/assets/res/svg_icons.dart';

TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = TempScreenModel();
  return TempScreenWidgetModel(model);
}

class TempScreenWidgetModel extends WidgetModel<TempScreen, ITempScreenModel> implements IDebugWidgetModel {
  final _defaultNavBarItems = [
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.inService),
      activeIcon: SvgPicture.asset(SvgIcons.inServiceActive),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.serviceWarehouse),
      activeIcon: SvgPicture.asset(SvgIcons.serviceWarehouseActive),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.serviceRecord),
      activeIcon: SvgPicture.asset(SvgIcons.serviceRecordActive),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.services),
      activeIcon: SvgPicture.asset(SvgIcons.servicesActive),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(SvgIcons.settings),
      activeIcon: SvgPicture.asset(SvgIcons.settingsActive),
    ),
  ];

  @override
  List<PageRouteInfo> get routes => _routes;

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _navigationBarItems;

  List<PageRouteInfo> get _routes {
    final defaultRoutes = <PageRouteInfo>[InServiceRouter(), ServiceWarehouseRouter(), ServiceRecordRouter(), ServicesRouter(), SettingsRouter()];

    return defaultRoutes;
  }

  List<BottomNavigationBarItem> get _navigationBarItems {
    final navBarItems = [..._defaultNavBarItems];

    return navBarItems;
  }

  TempScreenWidgetModel(super._model);

  @override
  String appBarTitle(RouteData topRoute) => _appBarTitle(topRoute);

  String _appBarTitle(RouteData topRoute) {
    switch (topRoute.path) {
      case AppRoutePaths.inServicePath:
        return 'in service';
      case AppRoutePaths.serviceWarehousePath:
        return 'serviceWarehouse';
      case AppRoutePaths.serviceRecordPath:
        return 'service Record';
      case AppRoutePaths.servicesPath:
        return 'services';
      case AppRoutePaths.settingsPath:
        return 'settings';
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
