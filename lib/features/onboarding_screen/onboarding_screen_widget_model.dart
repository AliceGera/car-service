import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/onboarding_screen/onboarding_screen.dart';
import 'package:car_service/features/onboarding_screen/onboarding_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

OnboardingScreenWidgetModel onboardingScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final router = appDependencies.router;
  final model = OnboardingScreenModel();
  final sharedPreferences = appDependencies.sharedPreferences;
  return OnboardingScreenWidgetModel(
    model,
    sharedPreferences,
    router,
  );
}

class OnboardingScreenWidgetModel extends WidgetModel<OnboardingScreen, OnboardingScreenModel> implements IOnboardingScreenWidgetModel {
  final SharedPreferences sharedPreferences;
  final AppRouter router;

  OnboardingScreenWidgetModel(
    super._model,
    this.sharedPreferences,
    this.router,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void openTemp() {
    router.push(TempRouter());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Future<void> finishOnboarding() async {
    await sharedPreferences.setBool('onboardingFinished', true);
  }
}

abstract class IOnboardingScreenWidgetModel implements IWidgetModel {
  Future<void> finishOnboarding();
  void openTemp();
}
