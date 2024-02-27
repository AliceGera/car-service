import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseWidget extends StatelessWidget {
  const ChooseWidget({
    required this.text,
    required this.assetName,
    this.color = AppColors.gray,
    required this.textColor,
    this.fieldName = '',
    this.isEdit = false,
    super.key,
  });

  final String text;
  final String assetName;
  final Color color;
  final Color textColor;
  final bool isEdit;
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              border: Border.all(color: color, width: 0.4),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,
                      style: fieldName.isEmpty ? AppTextStyle.superLight12.value.copyWith(color: textColor) : AppTextStyle.regular14.value.copyWith(color: textColor)),
                  SvgPicture.asset(assetName),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            fieldName,
            style: AppTextStyle.medium10.value.copyWith(color: AppColors.prime),
          ),
        ),
      ],
    );
  }
}
