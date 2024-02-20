

import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ChooseWidget extends StatelessWidget {
  const ChooseWidget({
    required this.text,
    required this.assetName,
    required this.color,
    super.key,
  });

  final String text;
  final String assetName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        border: Border.all(color: color, width: 0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppTextStyle.superLight12.value.copyWith(color: AppColors.buttonColor)),
            SvgPicture.asset(assetName),
          ],
        ),
      ),
    );
  }
}
