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
    AddCarRouter.name: (routeData) {
      final args = routeData.argsAs<AddCarRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddCarScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    AddObjectRouter.name: (routeData) {
      final args = routeData.argsAs<AddObjectRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddObjectScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    AddRecordRouter.name: (routeData) {
      final args = routeData.argsAs<AddRecordRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddRecordScreen(
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    CarInfoRouter.name: (routeData) {
      final args = routeData.argsAs<CarInfoRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CarInfoScreen(
          car: args.car,
          refreshCar: args.refreshCar,
          loadAgain: args.loadAgain,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    EditCarRouter.name: (routeData) {
      final args = routeData.argsAs<EditCarRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditCarScreen(
          loadAgain: args.loadAgain,
          refreshCar: args.refreshCar,
          car: args.car,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    EditObjectRouter.name: (routeData) {
      final args = routeData.argsAs<EditObjectRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditObjectScreen(
          loadAgain: args.loadAgain,
          objectType: args.objectType,
          object: args.object,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    EditRecordRouter.name: (routeData) {
      final args = routeData.argsAs<EditRecordRouterArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditRecordScreen(
          loadAgain: args.loadAgain,
          record: args.record,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
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
    OnboardingRouter.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouterArgs>(
          orElse: () => const OnboardingRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnboardingScreen(
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
    SplashRouter.name: (routeData) {
      final args = routeData.argsAs<SplashRouterArgs>(
          orElse: () => const SplashRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(
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
/// [AddCarScreen]
class AddCarRouter extends PageRouteInfo<AddCarRouterArgs> {
  AddCarRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = addCarScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AddCarRouter.name,
          args: AddCarRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AddCarRouter';

  static const PageInfo<AddCarRouterArgs> page =
      PageInfo<AddCarRouterArgs>(name);
}

class AddCarRouterArgs {
  const AddCarRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = addCarScreenWmFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AddCarRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [AddObjectScreen]
class AddObjectRouter extends PageRouteInfo<AddObjectRouterArgs> {
  AddObjectRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = addObjectWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AddObjectRouter.name,
          args: AddObjectRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AddObjectRouter';

  static const PageInfo<AddObjectRouterArgs> page =
      PageInfo<AddObjectRouterArgs>(name);
}

class AddObjectRouterArgs {
  const AddObjectRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = addObjectWidgetModelFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AddObjectRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [AddRecordScreen]
class AddRecordRouter extends PageRouteInfo<AddRecordRouterArgs> {
  AddRecordRouter({
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = addRecordScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AddRecordRouter.name,
          args: AddRecordRouterArgs(
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AddRecordRouter';

  static const PageInfo<AddRecordRouterArgs> page =
      PageInfo<AddRecordRouterArgs>(name);
}

class AddRecordRouterArgs {
  const AddRecordRouterArgs({
    required this.loadAgain,
    this.key,
    this.wmFactory = addRecordScreenWmFactory,
  });

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AddRecordRouterArgs{loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [CarInfoScreen]
class CarInfoRouter extends PageRouteInfo<CarInfoRouterArgs> {
  CarInfoRouter({
    required CarData car,
    void Function(CarData)? refreshCar,
    required void Function() loadAgain,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = carInfoScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          CarInfoRouter.name,
          args: CarInfoRouterArgs(
            car: car,
            refreshCar: refreshCar,
            loadAgain: loadAgain,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'CarInfoRouter';

  static const PageInfo<CarInfoRouterArgs> page =
      PageInfo<CarInfoRouterArgs>(name);
}

class CarInfoRouterArgs {
  const CarInfoRouterArgs({
    required this.car,
    this.refreshCar,
    required this.loadAgain,
    this.key,
    this.wmFactory = carInfoScreenWmFactory,
  });

  final CarData car;

  final void Function(CarData)? refreshCar;

  final void Function() loadAgain;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'CarInfoRouterArgs{car: $car, refreshCar: $refreshCar, loadAgain: $loadAgain, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [EditCarScreen]
class EditCarRouter extends PageRouteInfo<EditCarRouterArgs> {
  EditCarRouter({
    void Function()? loadAgain,
    void Function(CarData)? refreshCar,
    required CarData car,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = editCarScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          EditCarRouter.name,
          args: EditCarRouterArgs(
            loadAgain: loadAgain,
            refreshCar: refreshCar,
            car: car,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCarRouter';

  static const PageInfo<EditCarRouterArgs> page =
      PageInfo<EditCarRouterArgs>(name);
}

class EditCarRouterArgs {
  const EditCarRouterArgs({
    this.loadAgain,
    this.refreshCar,
    required this.car,
    this.key,
    this.wmFactory = editCarScreenWidgetModelFactory,
  });

  final void Function()? loadAgain;

  final void Function(CarData)? refreshCar;

  final CarData car;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'EditCarRouterArgs{loadAgain: $loadAgain, refreshCar: $refreshCar, car: $car, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [EditObjectScreen]
class EditObjectRouter extends PageRouteInfo<EditObjectRouterArgs> {
  EditObjectRouter({
    required void Function() loadAgain,
    required ObjectTypeData objectType,
    required ObjectData object,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = editObjectScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          EditObjectRouter.name,
          args: EditObjectRouterArgs(
            loadAgain: loadAgain,
            objectType: objectType,
            object: object,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'EditObjectRouter';

  static const PageInfo<EditObjectRouterArgs> page =
      PageInfo<EditObjectRouterArgs>(name);
}

class EditObjectRouterArgs {
  const EditObjectRouterArgs({
    required this.loadAgain,
    required this.objectType,
    required this.object,
    this.key,
    this.wmFactory = editObjectScreenWidgetModelFactory,
  });

  final void Function() loadAgain;

  final ObjectTypeData objectType;

  final ObjectData object;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'EditObjectRouterArgs{loadAgain: $loadAgain, objectType: $objectType, object: $object, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [EditRecordScreen]
class EditRecordRouter extends PageRouteInfo<EditRecordRouterArgs> {
  EditRecordRouter({
    void Function()? loadAgain,
    required RecordData record,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = editRecordScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          EditRecordRouter.name,
          args: EditRecordRouterArgs(
            loadAgain: loadAgain,
            record: record,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'EditRecordRouter';

  static const PageInfo<EditRecordRouterArgs> page =
      PageInfo<EditRecordRouterArgs>(name);
}

class EditRecordRouterArgs {
  const EditRecordRouterArgs({
    this.loadAgain,
    required this.record,
    this.key,
    this.wmFactory = editRecordScreenWidgetModelFactory,
  });

  final void Function()? loadAgain;

  final RecordData record;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'EditRecordRouterArgs{loadAgain: $loadAgain, record: $record, key: $key, wmFactory: $wmFactory}';
  }
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
/// [OnboardingScreen]
class OnboardingRouter extends PageRouteInfo<OnboardingRouterArgs> {
  OnboardingRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = onboardingScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          OnboardingRouter.name,
          args: OnboardingRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'OnboardingRouter';

  static const PageInfo<OnboardingRouterArgs> page =
      PageInfo<OnboardingRouterArgs>(name);
}

class OnboardingRouterArgs {
  const OnboardingRouterArgs({
    this.key,
    this.wmFactory = onboardingScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'OnboardingRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ServiceRecordScreen]
class ServiceRecordRouter extends PageRouteInfo<ServiceRecordRouterArgs> {
  ServiceRecordRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = serviceRecordScreenWmFactory,
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
    this.wmFactory = serviceRecordScreenWmFactory,
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
/// [SplashScreen]
class SplashRouter extends PageRouteInfo<SplashRouterArgs> {
  SplashRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = splashWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRouter.name,
          args: SplashRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRouter';

  static const PageInfo<SplashRouterArgs> page =
      PageInfo<SplashRouterArgs>(name);
}

class SplashRouterArgs {
  const SplashRouterArgs({
    this.key,
    this.wmFactory = splashWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SplashRouterArgs{key: $key, wmFactory: $wmFactory}';
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
