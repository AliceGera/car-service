import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';
import 'package:car_service/features/common/widgets/app_main_title.dart';
import 'package:car_service/features/common/widgets/app_objects_widget.dart';
import 'package:car_service/features/common/widgets/choose_edit_or_delete_dialog_widget.dart';
import 'package:car_service/features/common/widgets/delete_dialog_widget.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/service_warehouse/screens/service_warehouse_screen/service_warehouse_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:union_state/union_state.dart';

@RoutePage(
  name: AppRouteNames.serviceWarehouseScreen,
)
class ServiceWarehouseScreen extends ElementaryWidget<IServiceWarehouseScreenWidgetModel> {
  const ServiceWarehouseScreen({
    Key? key,
    WidgetModelFactory wmFactory = serviceWarehouseScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServiceWarehouseScreenWidgetModel wm) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppMainWidget(
                title: 'Cклад сервиса',
                isAddIcon: true,
                openAddObjectScreen: wm.openAddObjectScreen,
              ),
              UnionStateListenableBuilder<List<ObjectTypeWithObjectsData>>(
                unionStateListenable: wm.objectTypeWithObjectsState,
                builder: (_, object) {
                  return AppObjectsWidget(
                    isAdd: true,
                    onTapThreeDots: (objectData, objectType) {
                      showDialog<void>(
                        context: context,
                        builder: (ctx) => ChooseEditOrDeleteDialogWidget(
                          icon: SvgIcons.download,
                          editCarScreen: () {
                            Navigator.pop(ctx);
                            wm.openEditObjectScreen(objectData, objectType);
                          },
                          deleteCar: () {
                            Navigator.pop(ctx);
                            showDialog<void>(
                              context: context,
                              builder: (ctx) => DeleteDialogWidget(
                                deleteCar: () async {
                                  Navigator.pop(ctx);
                                  await wm.deleteObject.call(objectData);
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                    objectTypeWithObjects: object,
                    deleteObject: wm.deleteObject,
                    openAddObjectScreen: wm.openAddObjectScreen,
                    editObjectScreen: (objectData, objectType) {},
                  );
                },
                loadingBuilder: (_, object) => const SizedBox(),
                failureBuilder: (_, exception, object) => const SizedBox(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
