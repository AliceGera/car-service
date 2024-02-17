// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    InServiceRouter.name: (routeData) {
      final args = routeData.argsAs<InServiceRouterArgs>(
          orElse: () => const InServiceRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InServiceScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ServiceRecordRouter.name: (routeData) {
      final args = routeData.argsAs<ServiceRecordRouterArgs>(
          orElse: () => const ServiceRecordRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServiceRecordScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ServiceWarehouseRouter.name: (routeData) {
      final args = routeData.argsAs<ServiceWarehouseRouterArgs>(
          orElse: () => const ServiceWarehouseRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServiceWarehouseScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ServicesRouter.name: (routeData) {
      final args = routeData.argsAs<ServicesRouterArgs>(
          orElse: () => const ServicesRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServicesScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    SettingsRouter.name: (routeData) {
      final args = routeData.argsAs<SettingsRouterArgs>(
          orElse: () => const SettingsRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    TempRouter.name: (routeData) {
      final args = routeData.argsAs<TempRouterArgs>(
          orElse: () => const TempRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TempScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
  };
}

/// generated route for
/// [InServiceScreen]
class InServiceRouter extends PageRouteInfo<InServiceRouterArgs> {
  InServiceRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = inServiceScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          InServiceRouter.name,
          args: InServiceRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'InServiceRouter';

  static const PageInfo<InServiceRouterArgs> page =
      PageInfo<InServiceRouterArgs>(name);
}

class InServiceRouterArgs {
  const InServiceRouterArgs({
    this.key,
    this.wmFactory = inServiceScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'InServiceRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ServiceRecordScreen]
class ServiceRecordRouter extends PageRouteInfo<ServiceRecordRouterArgs> {
  ServiceRecordRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = serviceRecordScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ServiceRecordRouter.name,
          args: ServiceRecordRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ServiceRecordRouter';

  static const PageInfo<ServiceRecordRouterArgs> page =
      PageInfo<ServiceRecordRouterArgs>(name);
}

class ServiceRecordRouterArgs {
  const ServiceRecordRouterArgs({
    this.key,
    this.wmFactory = serviceRecordScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ServiceRecordRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ServiceWarehouseScreen]
class ServiceWarehouseRouter extends PageRouteInfo<ServiceWarehouseRouterArgs> {
  ServiceWarehouseRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = serviceWarehouseScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ServiceWarehouseRouter.name,
          args: ServiceWarehouseRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ServiceWarehouseRouter';

  static const PageInfo<ServiceWarehouseRouterArgs> page =
      PageInfo<ServiceWarehouseRouterArgs>(name);
}

class ServiceWarehouseRouterArgs {
  const ServiceWarehouseRouterArgs({
    this.key,
    this.wmFactory = serviceWarehouseScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ServiceWarehouseRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ServicesScreen]
class ServicesRouter extends PageRouteInfo<ServicesRouterArgs> {
  ServicesRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = servicesScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ServicesRouter.name,
          args: ServicesRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ServicesRouter';

  static const PageInfo<ServicesRouterArgs> page =
      PageInfo<ServicesRouterArgs>(name);
}

class ServicesRouterArgs {
  const ServicesRouterArgs({
    this.key,
    this.wmFactory = servicesScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ServicesRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRouter extends PageRouteInfo<SettingsRouterArgs> {
  SettingsRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = settingsScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRouter.name,
          args: SettingsRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';

  static const PageInfo<SettingsRouterArgs> page =
      PageInfo<SettingsRouterArgs>(name);
}

class SettingsRouterArgs {
  const SettingsRouterArgs({
    this.key,
    this.wmFactory = settingsScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SettingsRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [TempScreen]
class TempRouter extends PageRouteInfo<TempRouterArgs> {
  TempRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = initScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          TempRouter.name,
          args: TempRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'TempRouter';

  static const PageInfo<TempRouterArgs> page = PageInfo<TempRouterArgs>(name);
}

class TempRouterArgs {
  const TempRouterArgs({
    this.key,
    this.wmFactory = initScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'TempRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}
