import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
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
  ServicesScreen({
    Key? key,
    WidgetModelFactory wmFactory = servicesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);
  List<String> services = [
    'Замена масла и фильтра',
    'Технический осмотр автомобиля',
    'Замена тормозных колодок',
    'Шиномонтаж',
    'Регулировка ходовой части',
    'Диагностика двигателя',
    'Замена аккумулятора',
    'Обслуживание кондиционера'
  ];
  List<String> servicesDescription = [
    'Данная услуга включает в себя слив и замену масла двигателя и замену масляного фильтра.',
    'Наши квалифицированные специалисты проведут тщательный технический осмотр вашего автомобиля, чтобы выявить любые потенциальные проблемы и обеспечить его безопасную эксплуатацию.',
    'Наша команда опытных механиков проведет качественную замену тормозных колодок на вашем автомобиле, обеспечивая надежное и безопасное торможение. Мы используем только высококачественные запчасти, чтобы гарантировать долговечность и эффективность новых колодок.',
    'Наши специалисты быстро и качественно выполнат шиномонтаж, обеспечивая правильное установку и балансировку колес на вашем автомобиле.',
    'Проведем профессиональную регулировку ходовой части вашего автомобиля, чтобы обеспечить стабильность и комфорт при движении.',
    'С использованием современного оборудования проведем комплексную диагностику двигателя, чтобы выявить любые неисправности и предотвратить серьезные поломки.',
    'Быстро и профессионально заменим аккумулятор в вашем автомобиле, чтобы обеспечить надежную работу электрической системы.',
    'Профессионально проведем обслуживание кондиционера, включая заправку хладагентом и проверку на наличие утечек, чтобы обеспечить комфортное вождение в жаркую погоду. '
  ];
  List<String> servicesTime = [
    '30-60 минут',
    '60-120 минут',
    '30 минут',
    '60 минут',
    '60 минут',
    '60 минут',
    '30 минут',
    '60 минут',
  ];

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
              itemCount: services.length,
              itemBuilder: (context, index) => ServiceWidget(
                service: services[index],
                servicesDescription: servicesDescription[index],
                servicesTime: servicesTime[index],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ServiceWidget extends StatefulWidget {
  ServiceWidget({super.key, required this.service, required this.servicesDescription, required this.servicesTime});

  String service;
  String servicesDescription;
  String servicesTime;

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            widget.service,
            style: AppTextStyle.medium16.value,
          ),
          trailing: SvgPicture.asset(
            _customTileExpanded ? SvgIcons.closeArrow : SvgIcons.openArrow,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 0.2,
                    color: AppColors.gray,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      widget.servicesDescription,
                      style: AppTextStyle.regular13.value,
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(SvgIcons.serviceTime),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.servicesTime,
                          style: AppTextStyle.regular13.value,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _customTileExpanded = expanded;
            });
          },
        ),
      ),
    );
  }
}
