import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/splash/screen/splash_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

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
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin :Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.backgroundLight,
            AppColors.backgroundBlue,
          ],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: CircularProgressIndicator(color: AppColors.white,),
        ),
      ),
    );
  }
}
