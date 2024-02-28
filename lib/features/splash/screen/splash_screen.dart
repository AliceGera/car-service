import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/splash/screen/splash_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(
  name: AppRouteNames.splashScreen,
)
class SplashScreen extends ElementaryWidget<ISplashWidgetModel> {
  const SplashScreen({
    Key? key,
    WidgetModelFactory wmFactory = splashWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISplashWidgetModel wm) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.backgroundLight,
            AppColors.backgroundBlue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(SvgIcons.splashCar),
                Text(
                  'Мой автосервис',
                  style: AppTextStyle.regular28.value.copyWith(color: AppColors.splashColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
