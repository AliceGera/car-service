import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final bool isEnable;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final Color borderColor;

  const AppButtonWidget({
    required this.title,
    super.key,
    this.isEnable = true,
    this.onPressed,
    this.color,
    this.textColor,
    this.borderColor = AppColors.prime,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color ?? AppColors.prime),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: borderColor, width: 0.5),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyle.medium15.value.copyWith(color: textColor ?? AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
