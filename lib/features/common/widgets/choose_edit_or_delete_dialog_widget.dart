import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';

class ChooseEditOrDeleteDialogWidget extends StatelessWidget {
  final Function() editCarScreen;
  final Function() deleteCar;
  final String icon;

  const ChooseEditOrDeleteDialogWidget({
    super.key,
    required this.editCarScreen,
    required this.deleteCar,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: editCarScreen,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          'Редактировать ',
                          style: AppTextStyle.medium12.value,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: AppColors.gray,
                  height: 0.2,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: deleteCar,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'Удалить ',
                          style: AppTextStyle.medium12.value.copyWith(color: AppColors.red),
                        ),
                      ],
                    ),
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
