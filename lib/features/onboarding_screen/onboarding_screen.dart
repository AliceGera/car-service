import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/widgets/app_button_widget.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/onboarding_screen/onboarding_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(name: AppRouteNames.onboardingScreen)
class OnboardingScreen extends ElementaryWidget<IOnboardingScreenWidgetModel> {
  const OnboardingScreen({
    Key? key,
    WidgetModelFactory wmFactory = onboardingScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOnboardingScreenWidgetModel wm) {
    return OnboardingScreenBody(wm: wm);
  }
}

class OnboardingScreenBody extends StatefulWidget {
  final IOnboardingScreenWidgetModel wm;

  const OnboardingScreenBody({
    required this.wm,
    super.key,
  });

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreenBody> {
  final PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.backgroundLight,
            AppColors.backgroundBlue,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    onPageChanged: (idx) {
                      setState(() {
                        index = idx;
                      });
                    },
                    children: const <Widget>[
                      _MainWidget(
                        assetName: SvgIcons.onboarding1,
                        title: 'Сейчас в сервисе',
                        subtitle: 'Просматривайте автомобили и информацию о них, а также добавляйте новые или удаляйте убывшие.',
                      ),
                      _MainWidget(
                        assetName: SvgIcons.onboarding2,
                        title: 'Склад и услуги',
                        subtitle: 'Ведите учет доступных материалов на складе и держите рядом список предоставляемых услуг',
                      ),
                      _MainWidget(
                        assetName: SvgIcons.onboarding3,
                        title: 'Запись в сервис',
                        subtitle: 'Управляйте записями клиентов. Вы сможете добавлять, редактировать или удалять записи. ',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButtonWidget(
                          title: 'Пропустить',
                          color: Colors.black,
                          textColor: AppColors.white,
                          onPressed: () async {
                            await widget.wm.finishOnboarding();
                            widget.wm.openTemp();
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppButtonWidget(
                          title: 'Далее',
                          onPressed: () async {
                            if (index == 2) {
                              await widget.wm.finishOnboarding();
                              widget.wm.openTemp();
                            } else {
                              index++;
                              controller.jumpToPage(index);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: widget.wm.userAgreementOnTap,
                      child: Text(
                        'Условия использования',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.light10.value.copyWith(color: AppColors.darkGray),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        color: AppColors.prime,
                        height: 12,
                        width: 1,
                      ),
                    ),
                    InkWell(
                      onTap: widget.wm.privacyPolicyOnTap,
                      child: Text(
                        'Политика конфиденциальности',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.light10.value.copyWith(color: AppColors.darkGray),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MainWidget extends StatelessWidget {
  const _MainWidget({
    required this.assetName,
    required this.title,
    required this.subtitle,
  });

  final String assetName;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(assetName),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.semiBold28.value.copyWith(color: AppColors.prime),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    subtitle,
                    style: AppTextStyle.regular14.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
