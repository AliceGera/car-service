import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/features/common/widgets/app_main_title.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/services/screens/services_screen/services_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(
  name: AppRouteNames.servicesScreen,
)
class ServicesScreen extends ElementaryWidget<IServicesScreenWidgetModel> {
  const ServicesScreen({
    Key? key,
    WidgetModelFactory wmFactory = servicesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServicesScreenWidgetModel wm) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const AppMainWidget(title: 'Услуги сервиса'),
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) =>
                  InkWell(
                    //onTap: wm.openNewsScreen,
                    child: ExpansionTileExample(),
                  ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
      child: ExpansionTile(


        title: const Text('ExpansionTile 2'),
        //subtitle: const Text('Custom expansion arrow icon'),
        trailing: SvgPicture.asset(
          _customTileExpanded
              ? SvgIcons.closeArrow
              : SvgIcons.openArrow,
        ),
        children: const <Widget>[
          ListTile(title: Text('This is tile number 2')),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
          });
        },
      ),
    );
  }
}
