import 'package:car_service/features/app/di/app_scope.dart';
import 'package:car_service/features/navigation/service/router.dart';
import 'package:car_service/features/settings/screens/settings_screen/settings_screen.dart';
import 'package:car_service/features/settings/screens/settings_screen/settings_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

SettingsScreenWidgetModel settingsScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = SettingsScreenModel();
  final router = appDependencies.router;
  return SettingsScreenWidgetModel(
    model,
    router,
  );
}

class SettingsScreenWidgetModel extends WidgetModel<SettingsScreen, SettingsScreenModel> implements ISettingsScreenWidgetModel {
  final AppRouter router;

  SettingsScreenWidgetModel(
    super._model,
    this.router,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
  }

  @override
  Future<void> onTap() async {
    const url = 'https://flutter.dev';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Future<void> onTapAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}

abstract class ISettingsScreenWidgetModel implements IWidgetModel {
  void closeScreen() ;

  void onTap();

  void onTapAppReview() ;
}
