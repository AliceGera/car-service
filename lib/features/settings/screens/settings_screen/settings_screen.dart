import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/widgets/app_main_title.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/settings/screens/settings_screen/settings_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage(
  name: AppRouteNames.settingsScreen,
)
class SettingsScreen extends ElementaryWidget<ISettingsScreenWidgetModel> {
  const SettingsScreen({
    Key? key,
    WidgetModelFactory wmFactory = settingsScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISettingsScreenWidgetModel wm) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const AppMainWidget(title: 'Настройки'),
          CommonWidget(
            title: 'Политика конфиденциальности',
            icon: SvgIcons.security,
            onTap: wm.privacyPolicyOnTap,
          ),
          CommonWidget(
            title: 'Пользовательское соглашение',
            icon: SvgIcons.userAgreement,
            onTap: wm.userAgreementOnTap,
          ),
          const Divider(color: AppColors.white, thickness: 0.2),
          CommonWidget(
            title: 'Оценить приложение',
            icon: SvgIcons.rateApp,
            onTap: wm.onTapAppReview,
          ),
        ],
      ),
    );
  }
}

class CommonWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const CommonWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyle.medium16.value.copyWith(color: Colors.black)),
                SvgPicture.asset(icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
